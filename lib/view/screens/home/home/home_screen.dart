import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/translation/locate_keys.g.dart';
import 'package:password_manager/view/screens/home/analysis/analysis.dart';
import 'package:password_manager/view/screens/home/passwords/passwords.dart';
import 'package:password_manager/view/screens/home/search/search.dart';
import 'package:password_manager/view/screens/home/settings_screen/setting_screen.dart';
import 'package:password_manager/view/view_model/cubits/home/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static List<Widget> screens = [
    Passwords(),
    Analysis(),
    Search(),
    SettingScreen(),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit=HomeCubit.get(context);
        return Scaffold(
          body: HomeScreen.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.black,
            onTap: (index){
              cubit.navBar(index);
            },

            currentIndex: cubit.currentIndex,

            items: [

              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/home.png'),
                label: LocaleKeys.homeIcon.tr(),
                activeIcon: Image.asset('assets/icons/home.png',color: Colors.black,),


              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/analysis.png'),
                label: LocaleKeys.analysisIcon.tr(),
                activeIcon: Image.asset('assets/icons/analysis.png',color: Colors.black,),


              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icons/search.png'),
                label: LocaleKeys.searchIcon.tr(),
                activeIcon: Image.asset('assets/icons/search.png',color: Colors.black,),


              ), BottomNavigationBarItem(
                icon: Image.asset('assets/icons/icons.png'),
                label: LocaleKeys.settingIcon.tr(),


                activeIcon: Image.asset('assets/icons/icons.png',color: Colors.black,),


              ),
            ],
          ),
        );
      },
    );
  }
}

