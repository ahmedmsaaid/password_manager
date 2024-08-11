import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/translation/locate_keys.g.dart';

import '../../view_model/cubits/auth/auth_cubit.dart';

class OnboardTow extends StatelessWidget {
  const OnboardTow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
          ],
        ),
      ),
    ));
  }
}
