import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/core/widgets/analysiys_widget.dart';
import 'package:password_manager/core/widgets/navigator.dart';
import 'package:password_manager/core/widgets/selection.dart';
import 'package:password_manager/translation/locate_keys.g.dart';
import 'package:password_manager/view/screens/add/new_record.dart';
import 'package:password_manager/view/screens/profile/profile_screen.dart';
import 'package:password_manager/view/view_model/data/cubit/data_cubit.dart';

class MyCustomScrollView extends StatelessWidget {
  const MyCustomScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = DataCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigation.push(context, const ProfileScreen());
          },
          icon: const Icon(
            Icons.person_outline,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(LocaleKeys.analysis.tr()),
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
      body: BlocProvider<DataCubit>.value(
        value: BlocProvider.of<DataCubit>(context)..chickAnalysis(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 400.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(100.0, 20.0, 100.0, 20),
                        child: Stack(
                          children: [
                            const SizedBox(
                              width: 400,
                              height: 160,
                              child: CircularProgressIndicator(
                                value: 1,
                                strokeWidth: 20.0,
                                backgroundColor: Colors.black,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: 400,
                              height: 160,
                              child: CircularProgressIndicator(
                                value: cubit.analysisProgress() / 100,
                                strokeWidth: 18.0,
                                backgroundColor: Colors.white,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  cubit.linearProgressColor(
                                      cubit.analysisProgress() / 100),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 65, 10, 20),
                              child: Align(
                                alignment: AlignmentDirectional.center,
                                child: Text(
                                  '${cubit.analysisProgress().round()} %',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${cubit.analysisProgress().round()}% secured',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          statisticCard(cubit.safe.round(), 'Safe'),
                          statisticCard(cubit.wake.round(), 'Wake'),
                          statisticCard(cubit.resk.round(), 'Risk'),
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
                  return AnalysiysWidget(model: cubit.passwords[index]);
                },
                childCount: cubit.passwords.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget statisticCard(int value, String label) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black87),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text('$value'),
          Text(label),
        ],
      ),
    );
  }
}
