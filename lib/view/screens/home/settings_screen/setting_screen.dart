import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/core/widgets/navigator.dart';

import '../../../../core/widgets/selection.dart';
import '../../../../translation/locate_keys.g.dart';
import '../../add/new_record.dart';
import '../../profile/profile_screen.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
            onPressed: (){
              Navigation.push(context, ProfileScreen());
            },
            icon:Icon(Icons.person_outline,
              color: Colors.black,)
        ),
        centerTitle: true,
        title: Text(LocaleKeys.setting.tr()),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: (){Navigation.push(context, NewRecord());},
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: ListView(
          children: [
        Selection(
          text: LocaleKeys.profile.tr(),
          widget: IconButton(
              onPressed: () {
                Navigation.push(context, ProfileScreen());
              },
              icon: Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 30.sp,
              ),),

        ),
            Selection(
              text: LocaleKeys.permissions.tr(),
              widget: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 30.sp,
                ),),

            ),
            Selection(
              text: LocaleKeys.sync.tr(),
              widget: IconButton(
                onPressed: () {},
                icon: Switch(value: true,onChanged: (value){
                  value=value;
                },),),

            ),
            Selection(
              text: LocaleKeys.autofill.tr(),
              widget: IconButton(
                onPressed: () {},
                icon: Switch(value: false,onChanged: (value){
                  value=value;
                },),),

            ),
            Selection(
              text: LocaleKeys.about.tr(),
              widget: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 30.sp,
                ),),

            ),
            Selection(
              text: LocaleKeys.help.tr(),
              widget: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 30.sp,
                ),),

            ),
            Selection(
              text: LocaleKeys.version.tr(),
              widget: IconButton(
                onPressed: () {},
                icon: Text('1.0.0'),),

            ),
      ],),
    );
  }
}
