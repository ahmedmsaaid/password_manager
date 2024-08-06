import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/core/widgets/navigator.dart';
import 'package:password_manager/view/screens/onboard_screen/onboard_screen.dart';
import 'package:password_manager/view/view_model/cubits/auth/auth_cubit.dart';

import '../../../../core/widgets/selection.dart';
import '../../../../translation/locate_keys.g.dart';

import '../add/new_record.dart';
import '../home/analysis/analysis.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ],
            )),
        centerTitle: true,
        title: Text(LocaleKeys.profile.tr()),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigation.push(context, NewRecord());
              },
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 300.h,
            width: 400.w,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                CircleAvatar(
                    radius: 50,
                    child: Image.asset(
                      'assets/icons/Ellipse 12.png',
                      height: 100,
                    )),
                Column(
                  children: [
                    Text('Ahmed Saaid', style: TextStyle(fontSize: 16.sp)),
                    Text(
                      '8758066XXX',
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigation.push(context, Analysis());
                    },
                    child: Text(
                      'Edit profile',
                      style: TextStyle(color: Colors.black87),
                    ))
              ],
            ),
          ),
          Selection(
            text: LocaleKeys.switchAccount.tr(),
            widget: DropdownButton(
              items: [
                DropdownMenuItem(
                  child: Text('ahmed saaid'),
                  value: Text('ahmed saaid'),
                ),
                DropdownMenuItem(
                  child: Text('saaid'),
                  value: Text('saaid'),
                ),
              ],
              onChanged: (value) {},
            ),
          ),
          Selection(
            text: LocaleKeys.security.tr(),
            widget: Icon(Icons.arrow_forward_ios),
          ),
          Selection(
            text: LocaleKeys.trustedDevices.tr(),
            widget: Icon(Icons.arrow_forward_ios),
          ),
          Selection(
            text: LocaleKeys.backup.tr(),
            widget: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      floatingActionButton: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {},
        child: ElevatedButton(
          onPressed: () {
            AuthCubit.get(context).logOut();
            Navigation.push(context, OnboardScreen());
          },
          child: Text(
            LocaleKeys.logout.tr(),
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
