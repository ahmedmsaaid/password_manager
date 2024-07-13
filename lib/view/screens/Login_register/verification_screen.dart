import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/core/widgets/navigator.dart';

import '../../../translation/locate_keys.g.dart';
import '../home/passwords/passwords.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
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
              width: 280.w,
              height: 100.h,
      
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.sp),
                border:   Border.all(
                  color: Colors.black,
      
                ),
      
              ),
              child: Column(
                children: [
                  SizedBox(height: 6.h,),
                  Text(LocaleKeys.enterVerificationCode.tr(),style: TextStyle(fontSize: 18.sp),),
                  OtpTextField(keyboardType: TextInputType.number,
      
                    fillColor: Colors.black,
                    focusedBorderColor: Colors.green,
                    enabledBorderColor: Colors.black,
                    cursorColor: Colors.green,
      
      
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ),),

                ],
              ),
            ),
            SizedBox(height: 300.h,),
            ElevatedButton(
              onPressed: () {
                Navigation.push(context, Passwords());

              },
              child: Text(
                LocaleKeys.go.tr(),
                style: TextStyle(color: Colors.white, fontSize: 15.sp),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadiusDirectional.circular(12.r)),
                  side: BorderSide(color: Colors.black),
                  backgroundColor: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
