import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/core/models/profile_model.dart';
import 'package:password_manager/core/routing/routes.dart';
import 'package:password_manager/view/screens/Login_register/Login_register.dart';
import 'package:password_manager/view/screens/Login_register/verification_screen.dart';
import 'package:password_manager/view/screens/add/new_record.dart';
import 'package:password_manager/view/screens/home/analysis/analysis.dart';
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

class AppRoutes {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routs.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );

      case Routs.loginRegister:
        return MaterialPageRoute(
          builder: (_) => LoginRegister(),
        );
      case Routs.newRecord:
        return MaterialPageRoute(
          builder: (_) => NewRecord(),
        );
      case Routs.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => OnboardScreen(),
        );
      case Routs.onBoardOne:
        return MaterialPageRoute(
          builder: (_) => OnboardOne(),
        );
      case Routs.onBoardTow:
        return MaterialPageRoute(
          builder: (_) => OnboardTow(),
        );
      case Routs.onBoardThree:
        return MaterialPageRoute(
          builder: (_) => OnboardThree(),
        );
      case Routs.analysis:
        return MaterialPageRoute(
          builder: (_) => Analysis(),
        );
      // case Routs.details:
      //   return MaterialPageRoute(
      //     builder: (_) => Details(model: ,),
      //   );
      case Routs.passwords:
        return MaterialPageRoute(
          builder: (_) => Passwords(),
        );
      case Routs.profileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(ProfileModel())..getUserData,
            child: ProfileScreen(),
          ),
        );
      case Routs.settingsScreen:
        return MaterialPageRoute(
          builder: (_) => SettingScreen(),
        );
      case Routs.splashScreen:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case Routs.verification:
        return MaterialPageRoute(
          builder: (_) => VerificationScreen(),
        );
      default:
        return null;
    }
  }
}
