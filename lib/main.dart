import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/my_app.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations', // <-- change the path of the translations files
        fallbackLocale: Locale('en'),
        child: MyApp()
    ),
  );
}
/// To Generate Local Translation Keys File
///
///
/// flutter pub run easy_localization:generate -S assets/translations -O lib/translation -o locate_keys.g.dart -f keys
