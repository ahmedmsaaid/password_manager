import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/core/widgets/navigator.dart';
import 'package:password_manager/translation/locate_keys.g.dart';
import 'package:password_manager/view/screens/home/home/home_screen.dart';

import '../onboard_screen/onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        Future.delayed(Duration(seconds: 3), () {
          Navigation.push(context, OnboardScreen());
        });
      } else {
        Future.delayed(Duration(seconds: 3), () {
          Navigation.push(context, HomeScreen());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
        child: InkWell(
          onTap: () {
            Navigation.push(context, OnboardScreen());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    LocaleKeys.appName.tr(),
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )),
              Image(
                  image: Image.asset(
                'assets/icons/splash.png',
                height: 50,
              ).image),
            ],
          ),
        ),
      ),
    );
  }
}
