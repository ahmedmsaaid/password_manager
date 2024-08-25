import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/translation/locate_keys.g.dart';

import '../../view/view_model/cubits/home/home_cubit.dart';

class About{
  static  about(BuildContext context){
    var homeCubit = HomeCubit.get(context);
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: homeCubit.darkMood ? Colors.grey : Colors.black,
                width: 2.0,
              ),
            ),
            backgroundColor: homeCubit.darkMood ? Colors.black : Colors.white,
            content:Container(
              child: Text(LocaleKeys.aboutApp.tr()),
            ) ,

            actions: const [],
          );
        } );

  }

}