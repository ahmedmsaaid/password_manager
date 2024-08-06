import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:password_manager/core/models/password_model.dart';
import 'package:password_manager/core/widgets/navigator.dart';
import 'package:password_manager/core/widgets/widgets.dart';
import 'package:password_manager/view/screens/details/details.dart';

import '../models/generator.dart';

class Password extends StatelessWidget {
  const Password({super.key, required this.model});
  final PasswordModel model;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(25.r),
      child: InkWell(
        onTap: () {
          Navigation.push(
              context,
              Details(
                model: model,
              ));
        },
        borderRadius: BorderRadius.circular(25.r),
        child: Container(
          margin: EdgeInsets.all(3.0.sp),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.2),
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(10.0.sp),
            leading: Visibility(
                visible: model.icon != null,
                replacement: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(Generator.logo(model.name)),
                ),
                child: CircleAvatar(
                    radius: 20, child: Image.network(model.icon ?? ''))),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name ?? '',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  model.userId ?? '',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ],
            ),
            trailing: IconButton(
                onPressed: () {
                  Widgets.copy(model.password!, context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Coped'),
                    backgroundColor: Colors.green,
                  ));
                },
                icon: Icon(Iconsax.copy_outline)),
          ),
        ),
      ),
    );
  }
}