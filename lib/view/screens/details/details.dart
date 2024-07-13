import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/selection.dart';
import '../../../translation/locate_keys.g.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
          color: Colors.black,
        ),
        centerTitle: false,
        title: Text(LocaleKeys.back.tr()),
        actions: [
          Padding(
            padding:  EdgeInsets.all(8.0.sp),
            child: Icon(
              Icons.delete_outline,color: Colors.red,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
                radius: 45.r, child: Image.asset('assets/icons/adobe.png')),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Adope',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'ahmedsaaid908@gmail.com',
                  style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                ),
              ],
            ),
          ),
          Selection(
            text: LocaleKeys.detailsSettings.tr(),
            widget: Visibility(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: .5.h,
            endIndent: 25.w,
            indent: 25.w,
          ),
          Padding(
            padding:  EdgeInsets.only(left: 30.sp),
            child: Row(
              children: [
                Text(
                  LocaleKeys.link.tr(),
                  style: TextStyle(fontSize: 18.sp),
                ),
                SizedBox(
                  width: 80.w,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'adobe.com',
                      style: TextStyle(fontSize: 14.sp, color: Colors.blue),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding:   EdgeInsets.only(left: 30.sp),
            child: Row(
              children: [
                Text(
                  LocaleKeys.userId.tr(),
                  style: TextStyle(fontSize: 18.sp),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  'ahmedsaaid908@gmail.com',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding:   EdgeInsets.only(left: 30.sp),
            child: Row(
              children: [
                Text(
                  LocaleKeys.password.tr(),
                  style: TextStyle(fontSize: 18.sp),
                ),
                SizedBox(
                  width: 50.w,
                ),
                Text(
                  'Cz&nW!HBqVw#',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                )
              ],
            ),
          ),
          Padding(
            padding:   EdgeInsets.only(left: 30.sp),
            child: Row(
              children: [
                Text(
                  LocaleKeys.autofill.tr(),
                  style: TextStyle(fontSize: 18.sp),
                ),
                SizedBox(
                  width: 50.w,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Switch(
                    activeColor: Colors.blueAccent,
                    inactiveTrackColor: CupertinoColors.white,
                    value: false,
                    onChanged: (value) {
                      value = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),side: BorderSide(
                    color: Colors.black.withOpacity(.2)
                  )),backgroundColor: Colors.white,
                  
                ),
                onPressed: () {},
                child: Text(LocaleKeys.copyPassword.tr(),style: TextStyle(color: Colors.black87,fontSize: 12.sp,fontWeight: FontWeight.normal),),
              ), ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp),side: BorderSide(
                      color: Colors.black.withOpacity(.2)
                  )),backgroundColor: Colors.white,

                ),
                onPressed: () {},
                child: Text(LocaleKeys.changPassword.tr(),style: TextStyle(color: Colors.black87,fontSize: 12.sp,fontWeight: FontWeight.normal),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
