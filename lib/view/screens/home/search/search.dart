import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/core/widgets/password.dart';
import 'package:password_manager/core/widgets/search.dart';
import 'package:password_manager/view/view_model/data/cubit/data_cubit.dart';

import '../../../../translation/locate_keys.g.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController srechController = TextEditingController();
    return BlocBuilder<DataCubit, DataState>(
      builder: (context, state) {
        var cubit = DataCubit.get(context);
        return Scaffold(
          body: SafeArea(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: srechController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r)),
                    labelText: LocaleKeys.searchHere.tr(),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Visibility(
                visible: srechController.text.isNotEmpty,
                replacement: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.grey,
                          thickness: .5,
                          endIndent: 50,
                          indent: 50,
                        ),
                    itemCount: cubit.passwords.length,
                    itemBuilder: (context, index) =>
                        Password(model: cubit.passwords[index])),
                child: SearchWidget.item(cubit.passwords,
                    password: cubit.search(srechController)),
              ))
            ],
          )),
        );
      },
    );
  }
}
