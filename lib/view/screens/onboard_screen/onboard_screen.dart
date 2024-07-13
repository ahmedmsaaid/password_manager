import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/view/screens/onboard_screen/onboard_one.dart';
import 'package:password_manager/view/screens/onboard_screen/onboard_tow.dart';
import 'package:password_manager/view/view_model/auth_cubit.dart';

import 'onboard_three.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return PageView(
          controller: AuthCubit
              .get(context)
              .pageController,


          children: [
            OnboardOne(),
            OnboardTow(),
            OnboardThree()

          ],
        );
      },
    );
  }
}
