import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/navigator.dart';
import '../../../core/widgets/widgets.dart';
import '../../../translation/locate_keys.g.dart';
import '../../view_model/cubits/auth/auth_cubit.dart';
import 'verification_screen.dart';

class LoginRegister extends StatelessWidget {
  const LoginRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is CodeSent) {
          Navigation.push(context, const VerificationScreen());
        } else if (state is UserExsts) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                LocaleKeys.userExists.tr(),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: cubit.isLogin ? 30.h : 0,
                  ),
                  Image.asset(
                    'assets/icons/logo.png',
                    height: 80.h,
                  ),
                  Text(
                    LocaleKeys.appName.tr(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
                  ),
                  Text(
                    LocaleKeys.title.tr(),
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    width: 300.w,
                    height: cubit.isLogin ? 350.h : 420.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all()),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.sp),
                          margin: EdgeInsets.all(12.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.sp),
                              border: Border.all()),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: SizedBox(
                                      height: 50.h,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          cubit.enableRegister();
                                          cubit.clearControllers();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(12.r)),
                                            backgroundColor: !cubit.isLogin
                                                ? Colors.black
                                                : Colors.white),
                                        child: Text(
                                          LocaleKeys.register.tr(),
                                          style: TextStyle(
                                              color: !cubit.isLogin
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Expanded(
                                child: Container(
                                  child: SizedBox(
                                      height: 50.h,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          cubit.enableLogin();
                                          cubit.clearControllers();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(12.r)),
                                            side: const BorderSide(
                                                color: Colors.black),
                                            backgroundColor: cubit.isLogin
                                                ? Colors.black
                                                : Colors.white),
                                        child: Text(
                                          LocaleKeys.login.tr(),
                                          style: TextStyle(
                                              color: cubit.isLogin
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: !cubit.isLogin,
                          replacement: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0.sp),
                                child: Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: Text(
                                      LocaleKeys.personalDetails.tr(),
                                      style: TextStyle(fontSize: 16.sp),
                                    )),
                              ),
                              Widgets.textFormField(
                                context,
                                LocaleKeys.mobileNoError.tr(),
                                cubit.mobileController,
                                LocaleKeys.mobileNo.tr(),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                width: 200.w,
                                height: 45.h,
                                child: Visibility(
                                  visible: cubit.fullData(),
                                  replacement: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  12.r),
                                        ),
                                        side: const BorderSide(
                                            color: Colors.black),
                                        backgroundColor: Colors.white),
                                    child: Text(
                                      LocaleKeys.getVerificationCode.tr(),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15.sp),
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (cubit.isLogin) {
                                        cubit.phonAuth(
                                            cubit.mobileController.text);
                                      } else {
                                        cubit.chickIfUserExets(
                                            cubit.mobileController.text);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(12.r)),
                                        side: const BorderSide(
                                            color: Colors.black),
                                        backgroundColor: Colors.black),
                                    child: Text(
                                      LocaleKeys.getVerificationCode.tr(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          child: Expanded(
                            child: ListView(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10.0.sp),
                                  child: Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Text(
                                        LocaleKeys.personalDetails.tr(),
                                        style: TextStyle(fontSize: 16.sp),
                                      )),
                                ),
                                Widgets.textFormField(
                                    context,
                                    LocaleKeys.firsNameError.tr(),
                                    cubit.firstNameController,
                                    LocaleKeys.firstName.tr()),
                                Widgets.textFormField(
                                    context,
                                    LocaleKeys.lastNameError.tr(),
                                    cubit.lastNameController,
                                    LocaleKeys.lastName.tr()),
                                Widgets.textFormField(
                                    context,
                                    LocaleKeys.mobileNoError.tr(),
                                    cubit.mobileController,
                                    LocaleKeys.mobileNo.tr()),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: SizedBox(
                                    width: 80.w,
                                    height: 45.h,
                                    child: Visibility(
                                      visible: cubit.fullData(),
                                      replacement: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(12.r),
                                            ),
                                            side: const BorderSide(
                                                color: Colors.black),
                                            backgroundColor: Colors.white),
                                        child: Text(
                                          LocaleKeys.getVerificationCode.tr(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.sp),
                                        ),
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (cubit.isLogin) {
                                            cubit.phonAuth(
                                                cubit.mobileController.text);
                                          } else {
                                            cubit.chickIfUserExets(
                                                cubit.mobileController.text);
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(12.r)),
                                            side: const BorderSide(
                                                color: Colors.black),
                                            backgroundColor: Colors.black),
                                        child: Text(
                                          LocaleKeys.getVerificationCode.tr(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.sp),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
