import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Selection extends StatelessWidget {
  const Selection({
    super.key,required this.text,required this.widget,
  });
  final String text;
  final Widget widget;



  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Text(text,style: TextStyle(fontSize: 16.sp),),
        trailing: widget ,
        minTileHeight: 40,
      ),
    );
  }


}