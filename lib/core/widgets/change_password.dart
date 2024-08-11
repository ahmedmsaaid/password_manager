import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/core/widgets/navigator.dart';
import 'package:password_manager/translation/locate_keys.g.dart';
import 'package:password_manager/view/screens/home/passwords/passwords.dart';
import 'package:password_manager/view/view_model/data/cubit/data_cubit.dart';

class ChangePassword {
  static dialog(context, id) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return showDialog(
      context: context,
      builder: (
        context,
      ) {
        return AlertDialog(
          title: Center(
            child: Text(
              'New Password',
            ),
          ),
          content: BlocBuilder<DataCubit, DataState>(
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Container(
                  height: 100.h,
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // الاستخدام المناسب للمساحة
                    children: [
                      TextFormField(
                        controller: DataCubit.get(context).passwordController,
                        validator: (value) {
                          if ((value ?? '').trim().isEmpty) {
                            return LocaleKeys.passwordError.tr();
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: LocaleKeys.password.tr(),
                          suffixIcon: BlocBuilder<DataCubit, DataState>(
                            builder: (context, state) {
                              return DataCubit.get(context).trueMarkButton(
                                      DataCubit.get(context)
                                          .passwordController
                                          .text)
                                  ? Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.green,
                                    )
                                  : Icon(Icons.check_circle_outline);
                            },
                          ),
                        ),
                      ),
                      LinearProgressIndicator(
                        value: DataCubit.get(context).stringthChickvalue(
                            DataCubit.get(context).passwordController.text),
                        color: DataCubit.get(context).linearProgressColor(
                            DataCubit.get(context).stringthChickvalue(
                                DataCubit.get(context)
                                    .passwordController
                                    .text)),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  DataCubit.get(context).changePassword(id);
                  Navigation.push(context, Passwords());
                }
              },
              child: Text('Done'),
            ),
          ],
        );
      },
    );
  }
}
