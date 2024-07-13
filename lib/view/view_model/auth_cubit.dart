import 'package:bloc/bloc.dart';
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

  PageController pageController = PageController();
  TextEditingController passwordController = TextEditingController();

  bool isVisible = false;
  bool isLogin = false;
  bool codeSent = false;
  int currentPageIndex = 0;

  void nextButton(index) {
    doNavigationPage(index);
    emit(PageChanged());
  }

  void showPassword() {
    isVisible = !isVisible;
    emit(ChangePasswordIconState());
  }
  bool fullData(){
    if(
    mobileController.text.isEmpty ) {
      return false;
    }
    return true;
  }
  void loginWithMobile(){
    codeSent=!codeSent;
  }
  void clearControllers(){
    firstNameController.clear();
    lastNameController.clear();
    mobileController.clear();
  }
  void enableRegister() {
    isLogin = false;
    emit(ChangePasswordIconState());
  }void enableLogin() {
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
