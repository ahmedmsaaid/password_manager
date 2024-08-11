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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigation.push(context, const ProfileScreen());
            },
            icon: const Icon(
              Icons.person_outline,
              color: Colors.black,
            )),
        centerTitle: true,
        title: Text(LocaleKeys.setting.tr()),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigation.push(context, const NewRecord());
              },
              icon: const Icon(Icons.add),
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
                  ),
                ),
              ),
              BlocProvider.value(
                value: HomeCubit.get(context),
                child: Selection(
                  text: LocaleKeys.language.tr(),
                  widget: DropdownButton<String>(
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
                    items: [
                      DropdownMenuItem<String>(
                        value: "ar",
                        child: Text(LocaleKeys.arabic.tr()),
                      ),
                      DropdownMenuItem<String>(
                        value: "en",
                        child: Text(LocaleKeys.engilsh.tr()), // تصحيح اسم اللغة
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
                    activeColor: Colors.white,
                    activeTrackColor: Colors.black,
                    inactiveThumbColor: Colors.black,
                    inactiveTrackColor: Colors.white,
                    onChanged: (value) {
                      value = value;
                    },
                  ),
                ),
              ),
              Selection(
                text: LocaleKeys.darkmode.tr(),
                widget: IconButton(
                  onPressed: () {},
                  icon: Switch(
                    activeColor: Colors.white,
                    activeTrackColor: Colors.black,
                    inactiveThumbColor: Colors.black,
                    inactiveTrackColor: Colors.white,
                    value: false,
                    onChanged: (value) {
                      value = value;
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
                  icon: const Text('1.0.0'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
