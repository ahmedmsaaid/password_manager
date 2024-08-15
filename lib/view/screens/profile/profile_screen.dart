import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/cache/local/cache_helper.dart';
import 'package:password_manager/core/firebase/firebase.dart';
import 'package:password_manager/core/widgets/edit_profile.dart';
import 'package:password_manager/core/widgets/navigator.dart';
import 'package:password_manager/view/screens/splash/splash_screen.dart';
import 'package:password_manager/view/view_model/cubits/auth/auth_cubit.dart';

import '../../../../translation/locate_keys.g.dart';

import '../../view_model/cubits/home/home_cubit.dart';
import '../add/new_record.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          backgroundColor: cubit.darkMood ? Colors.black : Colors.white,
          appBar: AppBar(
            backgroundColor: cubit.darkMood ? Colors.black : Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: cubit.darkMood ? Colors.white : Colors.black,
                    ),
                  ],
                )),
            centerTitle: true,
            title: Text(
              LocaleKeys.profile.tr(),
              style: TextStyle(
                  color: cubit.darkMood ? Colors.white : Colors.black),
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
                    color: cubit.darkMood ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
          body: ListView(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 56,
                child: CircleAvatar(
                  backgroundColor: cubit.darkMood ? Colors.black : Colors.white,
                  radius: 53,
                  child: CircleAvatar(
                      radius: 50,
                      child: SharedHelper.getData(FirebaseKeys.image) != null
                          ? ClipOval(
                              child: Image.network(
                                SharedHelper.getData(FirebaseKeys.image),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                cacheHeight: 300,
                              ),
                            )
                          : SharedHelper.getData(FirebaseKeys.image)),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(50),
                width: 300,
                height: 320,
                decoration: BoxDecoration(
                    color: cubit.darkMood ? Colors.black : Colors.white,
                    border: Border.all(
                        width: 2,
                        color: cubit.darkMood ? Colors.grey : Colors.black),
                    borderRadius: BorderRadius.circular(25)),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              LocaleKeys.firstName.tr(),
                              style: TextStyle(
                                  fontSize: 12,
                                  color: cubit.darkMood
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                          Container(
                            width: 300,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: cubit.darkMood
                                    ? Colors.black
                                    : Colors.white,
                                border: Border.all(
                                    width: 1,
                                    color: cubit.darkMood
                                        ? Colors.grey
                                        : Colors.black),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(.8)),
                                SharedHelper.getData(FirebaseKeys.fristName)),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              LocaleKeys.lastName.tr(),
                              style: TextStyle(
                                  fontSize: 12,
                                  color: cubit.darkMood
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                          Container(
                            width: 300,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: cubit.darkMood
                                    ? Colors.black
                                    : Colors.white,
                                border: Border.all(
                                    width: 1,
                                    color: cubit.darkMood
                                        ? Colors.grey
                                        : Colors.black),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                                style: const TextStyle(color: Colors.grey),
                                SharedHelper.getData(FirebaseKeys.lastName)),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              LocaleKeys.mobileNo.tr(),
                              style: TextStyle(
                                  fontSize: 12,
                                  color: cubit.darkMood
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                          Container(
                            width: 300,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: cubit.darkMood
                                    ? Colors.black
                                    : Colors.white,
                                border: Border.all(
                                    width: 1,
                                    color: cubit.darkMood
                                        ? Colors.grey
                                        : Colors.black),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(.8)),
                                SharedHelper.getData(
                                    FirebaseKeys.mobileNumber)),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            EdirProfile.edit(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  cubit.darkMood ? Colors.white : Colors.black),
                          child: Text(
                            LocaleKeys.editProfile.tr(),
                            style: TextStyle(
                                color: cubit.darkMood
                                    ? Colors.black
                                    : Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {},
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      cubit.darkMood ? Colors.white : Colors.black),
              onPressed: () {
                AuthCubit.get(context).logOut();
                Navigation.push(context, const SplashScreen());
              },
              child: Text(
                LocaleKeys.logout.tr(),
                style: const TextStyle(color: Colors.deepOrange),
              ),
            ),
          ),
        );
      },
    );
  }
}
