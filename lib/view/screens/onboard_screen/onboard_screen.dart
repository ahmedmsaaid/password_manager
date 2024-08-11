import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/translation/locate_keys.g.dart';
import 'package:password_manager/view/screens/onboard_screen/onboard_one.dart';
import 'package:password_manager/view/screens/onboard_screen/onboard_tow.dart';
import 'package:password_manager/view/screens/onboard_screen/onboard_three.dart';
import '../../view_model/cubits/auth/auth_cubit.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final List<Widget> _pages = [OnboardOne(), OnboardTow(), OnboardThree()];
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _nextPage() {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // يمكن إضافة منطق للدخول إلى التطبيق بعد الانتهاء من الصفحات.
      print("Navigate to main app");
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(children: [
            PageView(
              controller: _pageController,
              children: _pages, // إضافة الصفحات هنا
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: Visibility(
                  visible: _currentIndex < 2,
                  child: ElevatedButton(
                    onPressed: _nextPage, // استدعاء الدالة
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.next.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_sharp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      // حجم الزر
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(12),
                      ),
                      backgroundColor: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 85,
                      height: 12,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black)),
                    ),
                    Container(
                      margin: EdgeInsets.all(3),
                      width: 85,
                      height: 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: _currentIndex == 1 || _currentIndex == 2
                              ? Colors.black
                              : Colors.white,
                          border: Border.all(color: Colors.black)),
                    ),
                    Container(
                      margin: EdgeInsets.all(3),
                      width: 85,
                      height: 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color:
                              _currentIndex == 2 ? Colors.black : Colors.white,
                          border: Border.all(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            )
          ]),
        );
      },
    );
  }
}
