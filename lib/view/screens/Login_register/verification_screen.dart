import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/core/routing/routes.dart';

import 'package:password_manager/view/view_model/cubits/auth/auth_cubit.dart';

import '../../../translation/locate_keys.g.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = AuthCubit.get(context);
    String otp = '';

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {},
      child: BlocListener<AuthCubit, AuthState>(
        listenWhen: (previous, current) {
          return previous != current;
        },
        listener: (context, state) {
          if (state is Success) {
            Navigator.pushNamed(context, Routs.homeScreen);

            if (!cubit.isLogin) {
              cubit.addUserToFirestore();
            }
          } else if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(LocaleKeys.wrongOtp.tr()),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ));
          }
        },
        child: Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Center(
              child: ListView(children: [
                Column(
                  children: [
                    SizedBox(
                      height: 30.h,
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
                      height: 100.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.sp),
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            LocaleKeys.enterVerificationCode.tr(),
                            style: TextStyle(fontSize: 18.sp),
                          ),
                          OtpTextField(
                            onSubmit: (String verificationCode) {
                              otp = verificationCode;
                            },
                            keyboardType: TextInputType.number,
                            fillColor: Colors.black,
                            focusedBorderColor: Colors.green,
                            enabledBorderColor: Colors.black,
                            cursorColor: Colors.green,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                            numberOfFields: 6,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        cubit.submitOtp(otp);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(12.r)),
                          side: const BorderSide(color: Colors.black),
                          backgroundColor: Colors.black),
                      child: Text(
                        LocaleKeys.go.tr(),
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
