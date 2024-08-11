import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/core/models/profile_model.dart';
import 'package:password_manager/core/routing/app_router.dart';
import 'package:password_manager/view/view_model/cubits/home/home_cubit.dart';
import 'package:password_manager/view/view_model/data/cubit/data_cubit.dart';
import 'view/screens/splash/splash_screen.dart';
import 'view/view_model/cubits/auth/auth_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRoutes});
  final AppRoutes appRoutes;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthCubit(ProfileModel()),
            ),
            BlocProvider(
                create: (context) => DataCubit()
                  ..getDataFireStore()
                  ..chickAnalysis()),
            BlocProvider(create: (context) => HomeCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: child,
            onGenerateRoute: appRoutes.generateRoute,
          ),
        );
      },
      child: SplashScreen(),
    );
  }
}
