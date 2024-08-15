import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:password_manager/cache/local/cache_helper.dart';
import 'package:password_manager/core/firebase/firebase.dart';
import 'package:password_manager/core/models/password_model.dart';
import 'package:random_password_generator/random_password_generator.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());

  static DataCubit get(context) => BlocProvider.of(context);

  final db = FirebaseFirestore.instance;
  List<PasswordModel> passwords = [];

  final websiteNameController = TextEditingController();
  final userIdController = TextEditingController();
  final passwordController = TextEditingController();
  final fristName = TextEditingController();
  final lastName = TextEditingController();
  XFile? photo;
  String imageUrl = '';
  late int strength;
  late int count;
  double safe = 0;
  double wake = 0;
  double resk = 0;
  double analysis = 0.58;
  bool showDeatels = false;
  bool trueMark = false;
  bool shimmer = false;

  String newPassword = '';
  bool letters = true;
  bool uppercase = true;
  bool numbers = true;
  bool specialChar = true;
  double passwordLength = 8.0;
  //Analysis Screen
  void shimmerOn() {
    shimmer = true;
    emit(ShimmerOn());
    print(shimmer);
    Future.delayed(const Duration(seconds: 2)).then((_) {
      shimmer = false;
      emit(ShimmerOf());
    });
  }

  void chickAnalysis() {
    resk = 0;
    wake = 0;
    safe = 0;
    for (var password in passwords) {
      if (stringthChickvalue(password.password) < 0.3) {
        resk += 1;
      } else if (stringthChickvalue(password.password) < 0.6) {
        wake += 1;
      } else {
        safe += 1;
      }
    }
  }

  String search(TextEditingController search) {
    emit(Seacrhing());
    String password;
    password = search.text;
    emit(Seacrhed());
    return password;
  }

  double analysisProgress() {
    double analysis = 0;

    analysis = safe / passwords.length.round();
    return analysis * 100;
  }

  //edit Profile Screen

  bool trueMarkButton(String value) {
    emit(ChangingtrueMarkIcon());
    bool val = false;
    if (value.length > 3) {
      val = true;
    }

    return val;
  }

  Future<void> picImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    photo = image;
    if (photo != null) {
      print('**********************Selected image path: ${photo!.path}');
    } else {
      print('**************No image selected.');
    }
  }

  Future<void> addImageTOfireStorage() async {
    try {
      Reference refrenceRoot = FirebaseStorage.instance.ref();
      Reference refrenceDirToimages = refrenceRoot.child('images');
      Reference referenceToUbload = refrenceDirToimages
          .child(SharedHelper.getData(FirebaseKeys.mobileNumber));

      if (photo != null) {
        await referenceToUbload.putFile(File(photo!.path));
        imageUrl = await referenceToUbload.getDownloadURL();
        print(imageUrl);
        addUserToFirestore();
      } else {
        throw Exception('No image selected.');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<void> addUserToFirestore() async {
    emit(LoadingAddUserToFireStore());
    print('********LoadingAddUserToFireStore************');
    try {
      await db
          .collection(FirebaseKeys.users)
          .doc(SharedHelper.getData(FirebaseKeys.mobileNumber))
          .set({
        FirebaseKeys.fristName: fristName.text,
        FirebaseKeys.lastName: lastName.text,
        FirebaseKeys.image: imageUrl
      }, SetOptions(merge: true));
      SharedHelper.saveData(FirebaseKeys.image, imageUrl);
      await SharedHelper.saveData(FirebaseKeys.fristName, fristName.text);
      await SharedHelper.saveData(FirebaseKeys.lastName, lastName.text);
      emit(SuccessAddUserToFireStore());
      clear();
      print('********SuccessAddUserToFireStore************');
    } catch (e) {
      emit(FaildAddUserToFireStore(e.toString()));
      print('********FaildAddUserToFireStore ${e.toString()}************');
    }
  }

  //detales screen
  void showDeatelsButton() {
    emit(LoadingShowDeatelsButton());

    showDeatels = !showDeatels;
    print(showDeatels);
    emit(ShowDeatelsButton());
  }

  //NewRecordScreenButtonsAndLogic

  final passwordGenerator = RandomPasswordGenerator();
  void clear() {
    websiteNameController.clear();
    userIdController.clear();
    passwordController.clear();
    fristName.clear();
    lastName.clear();
  }

  String genetarePassword(
      {bool letters = true,
      bool uppercase = true,
      bool numbers = true,
      bool specialChar = true,
      double passwordLength = 8.0}) {
    emit(LoadingPasswordGeneratnig());
    newPassword = passwordGenerator.randomPassword(
        letters: letters,
        numbers: numbers,
        passwordLength: passwordLength,
        specialChar: specialChar,
        uppercase: uppercase);
    passwordController.text = newPassword;
    emit(PasswordGenerated());

    return newPassword;
  }

  void changePasswordLength(value) {
    passwordLength = value;
    emit(ChangePasswordLength());
  }

  double stringthChick() {
    emit(LoadingSrtingthChangnig());
    double strength;
    if (passwordController.text.toString().isEmpty) {
      strength = passwordGenerator.checkPassword(password: newPassword);
    } else {
      strength =
          passwordGenerator.checkPassword(password: passwordController.text);
    }
    emit(SrtingthChanged());
    return strength;
  }

  int getPasswordId(userInputValue) {
    int index = 0;
    int count = 0;
    for (PasswordModel model in passwords) {
      if (model.name == userInputValue) {
        index = count;
      } else {
        count += 1;
      }
    }
    return index;
  }

  double stringthChickvalue(Password) {
    double strength;

    strength = passwordGenerator.checkPassword(password: Password);

    return strength;
  }

  Color linearProgressColor(double strength) {
    emit(LoadingColorChangnig());
    late Color color;

    if (strength < 0.3) {
      color = Colors.red;
    } else if (strength < 0.6) {
      color = Colors.orange;
    } else {
      color = Colors.green;
    }
    emit(ColorChanged());
    return color;
  }

//FireStore
  Future<void> addDataToFirestore() async {
    if (passwords.isEmpty) {
      count = 0;
    } else {
      count = passwords.length;
    }

    emit(LoadingAddData());

    try {
      DocumentReference data = db
          .collection(FirebaseKeys.users)
          .doc(SharedHelper.getData(FirebaseKeys.mobileNumber))
          .collection(FirebaseKeys.data)
          .doc();
      await data.set({
        FirebaseKeys.name: websiteNameController.text,
        FirebaseKeys.userId: userIdController.text,
        FirebaseKeys.password: passwordController.text,
        FirebaseKeys.index: count,
        "id": data.id,
      });

      emit(SuccessAddData());
      clear();
      print('********SuccessAddDataToFireStore************');
    } catch (e) {
      emit(ErrorAddData(msg: e.toString()));
      print('********FaildAddDataToFireStore ${e.toString()}************');
    }
  }

  Future<void> changePassword(String id) async {
    emit(LoadingAddData());
    print('********LoadingAddDataToFireStore************');

    try {
      DocumentReference data = db
          .collection(FirebaseKeys.users)
          .doc(SharedHelper.getData(FirebaseKeys.mobileNumber))
          .collection(FirebaseKeys.data)
          .doc(id);
      await data.set({
        FirebaseKeys.password: passwordController.text,
      }, SetOptions(merge: true));

      emit(SuccessAddData());
      clear();
      print('********SuccessAddDataToFireStore************');
    } catch (e) {
      emit(ErrorAddData(msg: e.toString()));
      print('********FaildAddDataToFireStore ${e.toString()}************');
    }
  }

  Future<void> getDataFireStore() async {
    emit(LoadinGetdData());
    passwords.clear();

    print('********LoadinGetdData************');

    try {
      final QuerySnapshot value = await db
          .collection(FirebaseKeys.users)
          .doc(SharedHelper.getData(FirebaseKeys.mobileNumber))
          .collection(FirebaseKeys.data)
          .get();

      if (value.docs.isNotEmpty) {
        for (var doc in value.docs) {
          PasswordModel passwordModel =
              PasswordModel.fromJson(doc.data() as Map<String, dynamic>);
          passwords.add(passwordModel);
        }

        passwords.sort((a, b) => (b.index ?? 0).compareTo(a.index ?? 0));
      } else {
        print('No documents found!');
      }
      emit(SuccessGetData());

      print('********SuccessGetUserData************');
    } catch (e) {
      emit(ErrorGetData(msg: e.toString()));
      print('Error fetching user data: $e');
    }
  }

  Future<void> remove(String id) async {
    emit(Deleting());
    try {
      DocumentReference docRef = db
          .collection(FirebaseKeys.users)
          .doc(SharedHelper.getData(FirebaseKeys.mobileNumber))
          .collection(FirebaseKeys.data)
          .doc(id);

      await docRef.delete();

      emit(Deleted());
    } catch (e) {
      emit(DeleteError(e.toString()));
      print('delete error: ${e.toString()}');
    }
  }

  //Checkboxs
  void numbersCheckbox(value) {
    numbers = value;
    emit(Checkboxs());
  }

  void lettersCheckbox(value) {
    letters = value;
    emit(Checkboxs());
  }

  void ubberCaswCheckbox(value) {
    uppercase = value;
    emit(Checkboxs());
  }

  void specialCharCheckbox(value) {
    specialChar = value;
    emit(Checkboxs());
  }
}
