import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:password_manager/core/widgets/navigator.dart';

import '../../translation/locate_keys.g.dart';

class Widgets{
  static TextFormField passwordFormField(BuildContext context, String err,bool isVisible,TextEditingController controller,String labelText,void Function()? onTap){
   return TextFormField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      obscureText: isVisible,
      validator: (value) {
        if ((value ?? '').trim().isEmpty) {
          return err;
        }
        return null;
      },
      controller:controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        labelText: labelText,
        prefixIcon: Icon(Icons.password),
        suffixIcon: InkWell(
          onTap:
            onTap,
          child: Visibility(
            visible: isVisible,
            replacement: Icon(Icons.password),
            child: Icon(Icons.remove_red_eye_rounded),
          ),
        ),
      ),
    );
  } static Padding textFormField(BuildContext context, String err,TextEditingController controller,String labelText,
      {Icon? icon}){
   return  Padding(
     padding: const EdgeInsets.all(10.0),
     child: TextFormField(
       onTapOutside:  (event) {
         FocusScope.of(context).unfocus();                    },
       controller: controller,
       validator: (value) {
         if ((value ?? '').trim().isEmpty) {
           return err;
         }
         return null;
       },
       decoration: InputDecoration(
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(12),
         ),
         labelText: labelText,
         prefixIcon:icon,
       ),
     ),
   );
  }
  static Widget items(BuildContext context,Widget screen){
    return Material(
      borderRadius: BorderRadius.circular(25.r),
      child: InkWell(
        onTap: (){Navigation.push(context, screen);},
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
    );
  }
  static Widget itemsWithAnalysis(BuildContext context,Widget screen){
    return Material(
      borderRadius: BorderRadius.circular(25.r),
      child: InkWell(
        onTap: (){Navigation.push(context, screen);},
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
                LinearProgressIndicator(
                  value: 0.82 ,
                   color: Colors.green,
                ),
              ],
            ),
            trailing: IconButton(
                onPressed: () {}, icon: Icon(Icons.copy_sharp)),
          ),
        ),
      ),
    );
  }

}