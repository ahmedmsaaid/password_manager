import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 40.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 85.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black)),
                      ),
                      Container(
                        margin: EdgeInsets.all(3.sp),
                        width: 85.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black)),
                      ),
                      Container(
                        margin: EdgeInsets.all(3),
                        width: 85.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                Image.asset(
                  'assets/icons/Group 2.png',
                  height: 180.h,
                ),
            
                Text(LocaleKeys.appName.tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40.sp),)
                ,Text(LocaleKeys.title.tr(),style: TextStyle(fontSize: 22.sp),),
            
            
                SizedBox(
                  height: 173.h,
                ),
                SizedBox(
                  width: 320,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      AuthCubit.get(context).isLogin=false;
                      Navigation.push(context, LoginRegister());
                    },
                    child: Text(
                      LocaleKeys.register.tr(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.normal),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(12)),
                        backgroundColor: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 320.w,
                  height: 45.h,
                  child: ElevatedButton(
                      onPressed: () {
                        AuthCubit.get(context).isLogin=true;
                        Navigation.push(context, LoginRegister());
                      },
                    child: Text(
                      LocaleKeys.alreadyHaveAnAccount.tr(),
                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(12.r)),
                        side: BorderSide(color: Colors.black),
                        backgroundColor: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
