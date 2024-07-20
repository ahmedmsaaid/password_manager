import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:password_manager/core/widgets/navigator.dart';
import 'package:password_manager/translation/locate_keys.g.dart';
import 'package:password_manager/view/screens/home/settings_screen/setting_screen.dart';
import 'package:password_manager/view/screens/profile/profile_screen.dart';

import '../../add/new_record.dart';
import '../search/search.dart';

class Passwords extends StatelessWidget {
  const Passwords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigation.push(context, ProfileScreen());
          },
          icon:Icon(Icons.person_outline,
          color: Colors.black,)
        ),
        centerTitle: true,
        title: Text(LocaleKeys.passwords.tr()),
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
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: CupertinoColors.inactiveGray,
          thickness: .5,
          endIndent: 50,
          indent: 50,
        ),
        itemCount: 5,
        itemBuilder:  (context, index) =>   Material(
          borderRadius: BorderRadius.circular(25.r),
          child: InkWell(
            onTap: (){Navigation.push(context, SettingScreen());},
            borderRadius: BorderRadius.circular(25.r),
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: CupertinoColors.lightBackgroundGray.withOpacity(.2),
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(10.0.sp),
                leading: Icon(
                  BoxIcons.bxl_facebook_circle,
                  color: Colors.blue,
                  size: 50.sp,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Behance',
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'design.steve@gmail.com',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.copy_sharp)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
