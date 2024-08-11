import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/core/models/generator.dart';
import 'package:password_manager/core/models/password_model.dart';
import 'package:password_manager/core/widgets/change_password.dart';
import 'package:password_manager/core/widgets/widgets.dart';
import 'package:password_manager/view/view_model/data/cubit/data_cubit.dart';

import '../../../../core/widgets/selection.dart';
import '../../../../translation/locate_keys.g.dart';

class Details extends StatelessWidget {
  Details({super.key, required this.model});
  final PasswordModel model;

  @override
  Widget build(BuildContext context) {
    var cubit = DataCubit.get(context);
    return BlocListener<DataCubit, DataState>(
      listenWhen: (previous, current) {
        return current != previous;
      },
      listener: (context, state) {
        DataCubit();
      },
      child: Scaffold(
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
              padding: EdgeInsets.all(8.0.sp),
              child: IconButton(
                onPressed: () {
                  DataCubit.get(context).remove(model.id ?? '');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Password Deleted')));
                  Navigator.pop(context);
                  DataCubit.get(context).getDataFireStore();
                },
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<DataCubit, DataState>(
          builder: (context, state) {
            return ListView(
              children: [
                ListTile(
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
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        model.userId ?? '',
                        style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
                Selection(
                  text: LocaleKeys.detailsSettings.tr(),
                  widget: Visibility(
                    visible: cubit.showDeatels,
                    replacement: IconButton(
                      onPressed: () {
                        cubit.showDeatelsButton();
                      },
                      icon: Icon(Icons.keyboard_arrow_up),
                    ),
                    child: IconButton(
                      onPressed: () {
                        cubit.showDeatelsButton();
                      },
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
                Visibility(
                  visible: cubit.showDeatels,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30.sp),
                        child: Row(
                          children: [
                            Text(
                              LocaleKeys.link.tr(),
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            SizedBox(
                              width: 80.w,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  Generator.link(model.name),
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.blue),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.sp),
                        child: Row(
                          children: [
                            Text(
                              LocaleKeys.userId.tr(),
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              model.userId ?? '',
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.sp),
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
                              model.password ?? '',
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.sp),
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
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  side: BorderSide(
                                      color: Colors.black.withOpacity(.2))),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              Widgets.copy(model.password!, context);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Coped'),
                                backgroundColor: Colors.green,
                              ));
                            },
                            child: Text(
                              LocaleKeys.copyPassword.tr(),
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  side: BorderSide(
                                      color: Colors.black.withOpacity(.2))),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              ChangePassword.dialog(context, model.id);
                            },
                            child: Text(
                              LocaleKeys.changPassword.tr(),
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
