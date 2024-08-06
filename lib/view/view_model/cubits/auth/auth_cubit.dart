import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/cache/local/cache_helper.dart';
import 'package:password_manager/core/firebase/firebase.dart';
import 'package:password_manager/core/models/profile_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.user) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  PageController pageController = PageController();
  TextEditingController passwordController = TextEditingController();

  bool isVisible = false;
  bool isLogin = false;
  late String mobileNumber;
  late String verificationId;
  ProfileModel user;

  int currentPageIndex = 0;
  final db = FirebaseFirestore.instance;
  void nextButton(index) {
    doNavigationPage(index);
    emit(PageChanged());
  }

  Future<void> addUserToFirestore() async {
    emit(LoadingAddUserToFireStore());
    print('********LoadingAddUserToFireStore************');
    try {
      await db
          .collection(FirebaseKeys.users)
          .doc(mobileController.text) // تأكد من أن هذا هو معرف المستخدم.
          .set({
        // يمكنك استخدام .set() إذا كنت ترغب في تحديد معرف الوثيقة.
        FirebaseKeys.fristName: firstNameController.text,
        FirebaseKeys.lastName: lastNameController.text,
        FirebaseKeys.mobileNumber: mobileController.text,
      }).then((_) {
        user = ProfileModel(
            fristName: firstNameController.text,
            lastName: lastNameController.text,
            image:
                'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?t=st=1721896253~exp=1721899853~hmac=d7ff8748613db92fdd13738aa6f05d2c13d04955ee9d59289d797cae92b8d589&w=740',
            mobileNumber: mobileController.text);
      });

      emit(SuccessAddUserToFireStore());
      print('********SuccessAddUserToFireStore************');
      getUserData();
    } catch (e) {
      emit(FaildAddUserToFireStore(msg: e.toString()));
      print('********FaildAddUserToFireStore ${e.toString()}************');
    }
  }

  Future<void> getUserData() async {
    emit(LoadingGetUserData());
    print('********SuccessAddUserToFireStore************');

    print('User mobile number: $mobileNumber');

    try {
      final DocumentSnapshot value =
          await db.collection(FirebaseKeys.users).doc(mobileNumber).get();
      if (value.exists) {
        // تحويل البيانات إلى النموذج الخاص بك
        final userData =
            ProfileModel.fromJson(value.data() as Map<String, dynamic>);
        SharedHelper.saveData(FirebaseKeys.fristName, userData.fristName);
        SharedHelper.saveData(FirebaseKeys.lastName, userData.lastName);
        SharedHelper.saveData(FirebaseKeys.mobileNumber, userData.mobileNumber);
        // معالجة البيانات
      } else {
        print('Document does not exist!');
      }
      emit(SuccessGetUserData());

      print('********SuccessGetUserData************');
    } catch (e) {
      emit(ErrorGetUserData(msg: e.toString()));
      print('Error fetching user data: $e');
    }
  }

  Future<void> phonAuth(String phoneNumber) async {
    emit(Loading());
    print('***************************loading************');
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
    mobileNumber = phoneNumber;
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    print('***************************verificationCompleted************');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException e) async {
    emit(Error(msg: e.toString()));
    print(
        '***************************verificationFailed************${e.toString()}');
  }

  void codeSent(String verificationId, int? resendToken) async {
    this.verificationId = verificationId;
    emit(CodeSent());
    print('***************************codeSent************');
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    debugPrint('codeAutoRetrievalTimeout');
    print('***************************codeAutoRetrievalTimeout************');
  }

  Future<void> submitOtp(smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    await signIn(credential);
    print('***************************submitOtp************');
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(Success());
      print('***************************Success************');
    } catch (e) {
      emit(Error(msg: e.toString()));
      print('***************************Error************');
    }
  }

  Future<void> logOut() async {
    FirebaseAuth.instance.signOut();
  }

  User getLogedUser() {
    return FirebaseAuth.instance.currentUser!;
  }

  void showPassword() {
    isVisible = !isVisible;
    emit(ChangePasswordIconState());
  }

  bool fullData() {
    if (mobileController.text.isEmpty) {
      return false;
    }
    return true;
  }

  void clearControllers() {
    firstNameController.clear();
    lastNameController.clear();
    mobileController.clear();
  }

  void enableRegister() {
    isLogin = false;
    emit(ChangePasswordIconState());
  }

  void enableLogin() {
    isLogin = true;
    emit(ChangePasswordIconState());
  }

  void currentPage(int index) {
    currentPageIndex = index;
    print('page num $index');
  }

  void doNavigationPage(index) {
    pageController.jumpToPage(index);
    emit(PageChanged());
  }
}
