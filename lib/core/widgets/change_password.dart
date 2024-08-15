import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/core/widgets/navigator.dart';
import 'package:password_manager/translation/locate_keys.g.dart';
import 'package:password_manager/view/screens/home/passwords/passwords.dart';
import 'package:password_manager/view/view_model/cubits/home/home_cubit.dart';
import 'package:password_manager/view/view_model/data/cubit/data_cubit.dart';

class ChangePassword {
  static dialog(context, id) {
    var cubit = HomeCubit.get(context);
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return showDialog(
      context: context,
      builder: (
        context,
      ) {
        return AlertDialog(
          backgroundColor: cubit.darkMood ? Colors.black : Colors.white,
          title: Center(
            child: Text(
              LocaleKeys.newPassword.tr(),
              style: TextStyle(
                  color: cubit.darkMood ? Colors.white : Colors.black),
            ),
          ),
          content: BlocBuilder<DataCubit, DataState>(
            builder: (context, state) {
              return Form(
                key: formKey,
                child: SizedBox(
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
                        style: TextStyle(
                          color: HomeCubit.get(context).darkMood
                              ? Colors.white
                              : Colors.black, // تغيير لون النص هنا
                        ),
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          labelText: LocaleKeys.password.tr(),
                          suffixIcon: BlocBuilder<DataCubit, DataState>(
                            builder: (context, state) {
                              return DataCubit.get(context).trueMarkButton(
                                      DataCubit.get(context)
                                          .passwordController
                                          .text)
                                  ? const Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.green,
                                    )
                                  : const Icon(Icons.check_circle_outline);
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
                  Navigation.push(context, const Passwords());
                }
              },
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }
}
