import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/view/view_model/cubits/home/home_cubit.dart';

class Selection extends StatelessWidget {
  const Selection({
    super.key,
    required this.text,
    required this.widget,
  });
  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                color: cubit.darkMood ? Colors.grey : Colors.black,
              ),
            ),
            trailing: widget,
            minTileHeight: 40,
          ),
        );
      },
    );
  }
}
