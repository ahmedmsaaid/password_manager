import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/core/widgets/analysiys_widget.dart';
import 'package:password_manager/core/widgets/navigator.dart';
import 'package:password_manager/core/widgets/selection.dart';
import 'package:password_manager/translation/locate_keys.g.dart';
import 'package:password_manager/view/screens/add/new_record.dart';
import 'package:password_manager/view/screens/profile/profile_screen.dart';
import 'package:password_manager/view/view_model/cubits/home/home_cubit.dart';
import 'package:password_manager/view/view_model/data/cubit/data_cubit.dart';

class Analysis extends StatelessWidget {
  const Analysis({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    var cubit = DataCubit.get(context);
    var mode = HomeCubit.get(context);
    return Scaffold(
      backgroundColor: mode.darkMood ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: mode.darkMood ? Colors.black : Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigation.push(context, const ProfileScreen());
          },
          icon: Icon(
            Icons.person_outline,
            color: mode.darkMood ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          LocaleKeys.analysis.tr(),
          style: TextStyle(color: mode.darkMood ? Colors.white : Colors.black),
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
                color: mode.darkMood ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: BlocProvider<DataCubit>.value(
        value: BlocProvider.of<DataCubit>(context)..chickAnalysis(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: mode.darkMood ? Colors.black : Colors.white,
              expandedHeight: 350.0.h,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: mode.darkMood ? Colors.black : Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            screenWidth * 0.10,
                            screenHeight * 0.005,
                            screenWidth * 0.10,
                            screenHeight * 0.005),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: cubit.passwords.isNotEmpty
                                  ? cubit.analysisProgress() / 100
                                  : 0,
                              strokeWidth: screenWidth * 0.2,
                              backgroundColor:
                                  mode.darkMood ? Colors.black : Colors.white,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                cubit.passwords.isNotEmpty
                                    ? cubit.linearProgressColor(
                                        cubit.analysisProgress() / 100)
                                    : Colors.white,
                              ),
                            ),
                            CircularProgressIndicator(
                              value: 1,
                              strokeWidth: screenWidth * 0.15,
                              backgroundColor:
                                  mode.darkMood ? Colors.black : Colors.white,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  mode.darkMood ? Colors.black : Colors.white),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.1),
                              child: Text(
                                '${cubit.passwords.isNotEmpty ? cubit.analysisProgress().round() : 0} %',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: mode.darkMood
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: screenHeight * 0.025,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          cubit.passwords.isNotEmpty
                              ? Text(
                                  '${cubit.analysisProgress().round()}% ${LocaleKeys.secured.tr()}',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: mode.darkMood
                                          ? Colors.white
                                          : Colors.black),
                                )
                              : Text(
                                  '0 ${LocaleKeys.secured.tr()}',
                                  style: TextStyle(
                                      color: mode.darkMood
                                          ? Colors.white
                                          : Colors.black),
                                )
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          statisticCard(
                              cubit.safe.round(), LocaleKeys.safe.tr(), mode),
                          statisticCard(
                              cubit.wake.round(), LocaleKeys.weak.tr(), mode),
                          statisticCard(
                              cubit.resk.round(), LocaleKeys.risk.tr(), mode),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Selection(
                        text: LocaleKeys.analysis.tr(),
                        widget: IconButton(
                          icon: const Icon(Icons.filter_list_rounded),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return cubit.passwords.isNotEmpty
                      ? AnalysiysWidget(model: cubit.passwords[index])
                      : Center(
                          child: Text(
                            LocaleKeys.addpasswordtoshowdata.tr(),
                            style: TextStyle(
                                color: mode.darkMood
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        );
                },
                childCount: cubit.passwords.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget statisticCard(int value, String label, mode) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: mode.darkMood ? Colors.black12 : Colors.white,
        border: Border.all(color: mode.darkMood ? Colors.grey : Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            '$value',
            style:
                TextStyle(color: mode.darkMood ? Colors.white : Colors.black),
          ),
          Text(
            label,
            style:
                TextStyle(color: mode.darkMood ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}
