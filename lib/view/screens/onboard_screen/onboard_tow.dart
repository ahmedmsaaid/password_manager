import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/core/widgets/navigator.dart';
import 'package:password_manager/translation/locate_keys.g.dart';

 import '../../view_model/cubits/auth/auth_cubit.dart';
import '../Login_register/Login_register.dart';

class OnboardTow extends StatelessWidget {
  const OnboardTow({super.key});

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
              'assets/icons/Group 8.png',
              height: 180.h,
            ),
            SizedBox(
              height: 50.h,
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.fast.tr(),
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      LocaleKeys.everyThingInSingleClick.tr(),
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      LocaleKeys.string2.tr(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 90,
            ),
            SizedBox(
              width: 320,
              height: 45,
              child: BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                child: ElevatedButton(
                  onPressed: () {

                    AuthCubit.get(context).doNavigationPage(2);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.next.tr(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.normal),
                      ),
                      Icon(Icons.arrow_forward_sharp,color: Colors.white,),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(
                              12)),
                      backgroundColor: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
