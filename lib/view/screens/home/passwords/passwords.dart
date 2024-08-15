import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/core/widgets/navigator.dart';
import 'package:password_manager/core/widgets/password.dart';
import 'package:password_manager/translation/locate_keys.g.dart';
import 'package:password_manager/view/screens/profile/profile_screen.dart';
import 'package:password_manager/view/view_model/cubits/home/home_cubit.dart';
import 'package:password_manager/view/view_model/data/cubit/data_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../add/new_record.dart';

class Passwords extends StatelessWidget {
  const Passwords({super.key});

  @override
  Widget build(BuildContext context) {
    var c = HomeCubit.get(context);
    return BlocBuilder<DataCubit, DataState>(
      builder: (context, state) {
        var cubit = DataCubit.get(context);

        return Scaffold(
          backgroundColor: c.darkMood ? Colors.black : Colors.white,
          appBar: AppBar(
            backgroundColor: c.darkMood ? Colors.black : Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigation.push(context, const ProfileScreen());
                },
                icon: Icon(
                  Icons.person_outline,
                  color: c.darkMood ? Colors.white : Colors.black,
                )),
            centerTitle: true,
            title: Text(
              LocaleKeys.passwords.tr(),
              style: TextStyle(color: c.darkMood ? Colors.white : Colors.black),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigation.push(context, const NewRecord());
                  },
                  icon: Icon(
                    Icons.add,
                    color: c.darkMood ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
          body: RefreshIndicator(
              onRefresh: () async {
                cubit.shimmerOn();
                await cubit.getDataFireStore();
              },
              child: cubit.passwords.isNotEmpty
                  ? ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                            color: CupertinoColors.inactiveGray,
                            thickness: .5,
                            endIndent: 50,
                            indent: 50,
                          ),
                      itemCount: cubit.passwords.length,
                      itemBuilder: (context, index) => cubit.shimmer
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.white,
                              period: const Duration(milliseconds: 2000),
                              child: Password(model: cubit.passwords[index]))
                          : Password(model: cubit.passwords[index]))
                  : Center(
                      child: Text(
                        LocaleKeys.addpasswordtoshowdata.tr(),
                        style: TextStyle(
                            color: c.darkMood ? Colors.white : Colors.black),
                      ),
                    )),
        );
      },
    );
  }
}
