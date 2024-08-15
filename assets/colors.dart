import 'package:flutter/material.dart';
import 'package:password_manager/view/view_model/cubits/home/home_cubit.dart';

class AppColors {
  final bool mode = HomeCubit().darkMood;
  static Color p = Colors.white;
  static Color s = Colors.black;
  void theem() {
    if (mode == true) {
      p = Colors.black;
      s = Colors.white;
    } else {
      s = Colors.black;
      p = Colors.white;
    }
  }
}
