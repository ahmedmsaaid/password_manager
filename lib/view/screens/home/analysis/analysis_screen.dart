import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              expandedHeight: 400.0,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: mode.darkMood ? Colors.black : Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(100.0, 20.0, 100.0, 20),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 400,
                              height: 160,
                              child: CircularProgressIndicator(
                                value: 1,
                                strokeWidth: 20.0,
                                backgroundColor:
                                    mode.darkMood ? Colors.white : Colors.black,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 400,
                              height: 160,
                              child: CircularProgressIndicator(
                                value: cubit.passwords.isNotEmpty
                                    ? cubit.analysisProgress() / 100
                                    : 0,
                                strokeWidth: 18.0,
                                backgroundColor: Colors.white,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    cubit.passwords.isNotEmpty
                                        ? cubit.linearProgressColor(
                                            cubit.analysisProgress() / 100)
                                        : Colors.white),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 65, 10, 20),
                              child: Align(
                                  alignment: AlignmentDirectional.center,
                                  child: cubit.passwords.isNotEmpty
                                      ? Text(
                                          '${cubit.analysisProgress().round()} %',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: mode.darkMood
                                                  ? Colors.white
                                                  : Colors.black),
                                        )
                                      : Text(
                                          '0 %',
                                          style: TextStyle(
                                              color: mode.darkMood
                                                  ? Colors.white
                                                  : Colors.black),
                                        )),
                            )
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
                                      fontSize: 18,
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
                      const SizedBox(height: 15),
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
                      const SizedBox(height: 15),
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
      padding: const EdgeInsets.all(12),
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
