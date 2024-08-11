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

import '../add/new_record.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ],
                )),
            centerTitle: true,
            title: Text(LocaleKeys.profile.tr()),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigation.push(context, const NewRecord());
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          body: ListView(
            children: [
              CircleAvatar(
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
              Container(
                margin: const EdgeInsets.all(50),
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(25)),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Text(
                              LocaleKeys.firstName.tr(),
                              style: const TextStyle(fontSize: 10),
                            ),
                          ),
                          Container(
                            width: 300,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
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
                              style: const TextStyle(fontSize: 10),
                            ),
                          ),
                          Container(
                            width: 300,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(.8)),
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
                              style: const TextStyle(fontSize: 10),
                            ),
                          ),
                          Container(
                            width: 300,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
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
                              backgroundColor: Colors.black),
                          child: Text(
                            LocaleKeys.editProfile.tr(),
                            style: const TextStyle(color: Colors.white),
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
              onPressed: () {
                AuthCubit.get(context).logOut();
                Navigation.push(context, const SplashScreen());
              },
              child: Text(
                LocaleKeys.logout.tr(),
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),
        );
      },
    );
  }
}
