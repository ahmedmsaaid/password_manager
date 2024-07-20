import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/widgets.dart';
import '../../../../translation/locate_keys.g.dart';
import '../../details/details.dart';


class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r)
                ),
                labelText: LocaleKeys.searchHere.tr(),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView(
              children: [
                Widgets.items(context, Details()),
            Widgets.items(context, Details()),
            Widgets.items(context, Details()),
            Widgets.items(context, Details()),
            Widgets.items(context, Details()),
            Widgets.items(context, Details()),
            Widgets.items(context, Details()),
              ],
                ),
          )
        ],
      )),
    );
  }
}
