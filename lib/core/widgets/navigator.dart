import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigation{
  static void push(BuildContext context,Widget screen ){
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen,));
  }static void pushAndRemoveUntil(BuildContext context,Widget screen ){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => screen,),(route) => false,);
  }
}