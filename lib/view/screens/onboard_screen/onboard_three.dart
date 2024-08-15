import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/core/routing/routes.dart';
import 'package:password_manager/translation/locate_keys.g.dart';

import '../../../core/widgets/navigator.dart';
import '../../view_model/cubits/auth/auth_cubit.dart';
import '../Login_register/Login_register.dart';

class OnboardThree extends StatelessWidget {
  const OnboardThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Stack(children: [
            Column(
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Center(
                  child: Image.asset(
                    'assets/icons/Group 2.png',
                    height: 180.h,
                  ),
                ),
                Text(
                  LocaleKeys.appName.tr(),
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 40.sp),
                ),
                Text(
                  LocaleKeys.title.tr(),
                  style: TextStyle(fontSize: 22.sp),
                ),
                SizedBox(
                  height: 173.h,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            Align(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 400.h),
                      child: SizedBox(
                        width: 320,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            AuthCubit.get(context).isLogin = false;
                            Navigation.push(context, const LoginRegister());
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(12)),
                              backgroundColor: Colors.black),
                          child: Text(
                            LocaleKeys.register.tr(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 320.w,
                      height: 45.h,
                      child: ElevatedButton(
                        onPressed: () {
                          AuthCubit.get(context).isLogin = true;
                          Navigator.pushNamed(context, Routs.loginRegister);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(12.r)),
                            side: const BorderSide(color: Colors.black),
                            backgroundColor: Colors.white),
                        child: Text(
                          LocaleKeys.alreadyHaveAnAccount.tr(),
                          style:
                              TextStyle(color: Colors.black, fontSize: 15.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
