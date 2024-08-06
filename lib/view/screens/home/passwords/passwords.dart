import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/core/widgets/navigator.dart';
import 'package:password_manager/core/widgets/password.dart';
import 'package:password_manager/translation/locate_keys.g.dart';
import 'package:password_manager/view/screens/profile/profile_screen.dart';
import 'package:password_manager/view/view_model/data/cubit/data_cubit.dart';

import '../../add/new_record.dart';

class Passwords extends StatelessWidget {
  const Passwords({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataCubit, DataState>(
      builder: (context, state) {
        var cubit = DataCubit.get(context);

        return state is LoadinGetdData || state is LoadingAddData
            ? Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                      onPressed: () {
                        Navigation.push(context, ProfileScreen());
                      },
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.black,
                      )),
                  centerTitle: true,
                  title: Text(LocaleKeys.passwords.tr()),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {
                          Navigation.push(context, NewRecord());
                        },
                        icon: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                body: RefreshIndicator(
                  onRefresh: () async {
                    await cubit.getDataFireStore();
                  },
                  child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            color: CupertinoColors.inactiveGray,
                            thickness: .5,
                            endIndent: 50,
                            indent: 50,
                          ),
                      itemCount: cubit.passwords.length,
                      itemBuilder: (context, index) =>
                          Password(model: cubit.passwords[index])),
                ),
              );
      },
    );
  }
}
