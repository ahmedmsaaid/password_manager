import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/core/widgets/navigator.dart';
import 'package:password_manager/view/view_model/cubits/home/home_cubit.dart';

import '../../../../core/widgets/selection.dart';
import '../../../../translation/locate_keys.g.dart';
import '../../add/new_record.dart';
import '../../profile/profile_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          backgroundColor:
              HomeCubit.get(context).darkMood ? Colors.black : Colors.white,
          appBar: AppBar(
            backgroundColor:
                HomeCubit.get(context).darkMood ? Colors.black : Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigation.push(context, const ProfileScreen());
                },
                icon: Icon(
                  Icons.person_outline,
                  color: cubit.darkMood ? Colors.white : Colors.black,
                )),
            centerTitle: true,
            title: Text(
              LocaleKeys.setting.tr(),
              style: TextStyle(
                color: cubit.darkMood ? Colors.white : Colors.black,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigation.push(context, const NewRecord());
                  },
                  icon: Icon(
                    Icons.add,
                    color: cubit.darkMood ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
          body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              var cubit = HomeCubit.get(context);
              return ListView(
                children: [
                  Selection(
                    text: LocaleKeys.profile.tr(),
                    widget: IconButton(
                      onPressed: () {
                        Navigation.push(context, const ProfileScreen());
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        size: 30.sp,
                        color: cubit.darkMood ? Colors.grey : Colors.black,
                      ),
                    ),
                  ),
                  BlocProvider.value(
                    value: HomeCubit.get(context),
                    child: Selection(
                      text: LocaleKeys.language.tr(),
                      widget: DropdownButton<String>(
                        dropdownColor:
                            cubit.darkMood ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(12),

                        onChanged: (value) {
                          if (value != null) {
                            HomeCubit.get(context).changeLang(value);
                            if (value == 'ar') {
                              context.setLocale(const Locale('ar'));
                            } else {
                              context.setLocale(const Locale('en'));
                            }
                          }
                        },
                        value: HomeCubit.get(context)
                            .dropdownValue, // تحديد القيمة الحالية هنا

                        style: TextStyle(
                          color: cubit.darkMood ? Colors.white : Colors.black,
                        ),
                        items: [
                          DropdownMenuItem<String>(
                            value: "ar",
                            child: Text(
                              LocaleKeys.arabic.tr(),
                              style: TextStyle(
                                color: cubit.darkMood
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "en",
                            child: Text(
                              LocaleKeys.engilsh.tr(),
                              style: TextStyle(
                                color: cubit.darkMood
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ), // تصحيح اسم اللغة
                          ),
                        ],
                      ),
                    ),
                  ),
                  Selection(
                    text: LocaleKeys.sync.tr(),
                    widget: IconButton(
                      onPressed: () {},
                      icon: Switch(
                        value: true,
                        activeColor:
                            cubit.darkMood ? Colors.black : Colors.white,
                        activeTrackColor:
                            cubit.darkMood ? Colors.white : Colors.black,
                        inactiveThumbColor:
                            cubit.darkMood ? Colors.white : Colors.black,
                        inactiveTrackColor:
                            cubit.darkMood ? Colors.black : Colors.white,
                        onChanged: (value) {
                          value = value;
                        },
                      ),
                    ),
                  ),
                  BlocProvider.value(
                    value: HomeCubit.get(context),
                    child: Selection(
                      text: LocaleKeys.darkmode.tr(),
                      widget: Switch(
                        activeColor:
                            cubit.darkMood ? Colors.black : Colors.white,
                        activeTrackColor:
                            cubit.darkMood ? Colors.white : Colors.black,
                        inactiveThumbColor:
                            cubit.darkMood ? Colors.white : Colors.black,
                        inactiveTrackColor:
                            cubit.darkMood ? Colors.black : Colors.white,
                        value: HomeCubit.get(context).darkMood,
                        onChanged: (value) {
                          HomeCubit.get(context).darkMoode();
                        },
                      ),
                    ),
                  ),
                  Selection(
                    text: LocaleKeys.about.tr(),
                    widget: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: cubit.darkMood ? Colors.grey : Colors.black,
                        size: 30.sp,
                      ),
                    ),
                  ),
                  // Selection(
                  //   text: LocaleKeys.help.tr(),
                  //   widget: IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       Icons.keyboard_arrow_right_outlined,
                  //       size: 30.sp,
                  //     ),
                  //   ),
                  // ),
                  Selection(
                    text: LocaleKeys.version.tr(),
                    widget: IconButton(
                      onPressed: () {},
                      icon: Text(
                        '1.0.0',
                        style: TextStyle(
                          color: cubit.darkMood ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
