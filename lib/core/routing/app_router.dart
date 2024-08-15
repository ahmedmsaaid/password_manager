import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/core/models/profile_model.dart';
import 'package:password_manager/core/routing/routes.dart';
import 'package:password_manager/view/screens/Login_register/Login_register.dart';
import 'package:password_manager/view/screens/Login_register/verification_screen.dart';
import 'package:password_manager/view/screens/add/new_record.dart';
import 'package:password_manager/view/screens/home/analysis/analysis_screen.dart';
import 'package:password_manager/view/screens/home/home/home_screen.dart';
import 'package:password_manager/view/screens/home/passwords/passwords.dart';
import 'package:password_manager/view/screens/home/settings_screen/setting_screen.dart';
import 'package:password_manager/view/screens/onboard_screen/onboard_one.dart';
import 'package:password_manager/view/screens/onboard_screen/onboard_screen.dart';
import 'package:password_manager/view/screens/onboard_screen/onboard_three.dart';
import 'package:password_manager/view/screens/onboard_screen/onboard_tow.dart';
import 'package:password_manager/view/screens/profile/profile_screen.dart';
import 'package:password_manager/view/screens/splash/splash_screen.dart';
import 'package:password_manager/view/view_model/cubits/auth/auth_cubit.dart';
import 'package:password_manager/view/view_model/cubits/home/home_cubit.dart';
import 'package:password_manager/view/view_model/data/cubit/data_cubit.dart';

class AppRoutes {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routs.homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => DataCubit()
              ..getDataFireStore()
              ..chickAnalysis(),
            child: BlocProvider(
              create: (context) => HomeCubit(), // تأكد من إضافة HomeCubit هنا
              child: const HomeScreen(),
            ),
          ),
        );

      case Routs.loginRegister:
        return MaterialPageRoute(
          builder: (_) => const LoginRegister(),
        );
      case Routs.newRecord:
        return MaterialPageRoute(
          builder: (_) => const NewRecord(),
        );
      case Routs.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardScreen(),
        );
      case Routs.onBoardOne:
        return MaterialPageRoute(
          builder: (_) => const OnboardOne(),
        );
      case Routs.onBoardTow:
        return MaterialPageRoute(
          builder: (_) => const OnboardTow(),
        );
      case Routs.onBoardThree:
        return MaterialPageRoute(
          builder: (_) => const OnboardThree(),
        );
      case Routs.analysis:
        return MaterialPageRoute(
          builder: (_) => const Analysis(),
        );
      // case Routs.details:
      //   return MaterialPageRoute(
      //     builder: (_) => Details(model: ,),
      //   );
      case Routs.passwords:
        return MaterialPageRoute(
          builder: (_) => const Passwords(),
        );
      case Routs.profileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => DataCubit(),
            child: const ProfileScreen(),
          ),
        );
      case Routs.settingsScreen:
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        );
      case Routs.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routs.verification:
        return MaterialPageRoute(
          builder: (_) => const VerificationScreen(),
        );
      default:
        return null;
    }
  }
}
