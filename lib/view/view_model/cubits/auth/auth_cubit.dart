import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  PageController pageController = PageController();
  TextEditingController passwordController = TextEditingController();

  bool isVisible = false;
  bool isLogin = false;
  late String verificationId;

  int currentPageIndex = 0;

  void nextButton(index) {
    doNavigationPage(index);
    emit(PageChanged());
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
