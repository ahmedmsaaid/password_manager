import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/translation/locate_keys.g.dart';
import 'package:password_manager/view/view_model/data/cubit/data_cubit.dart';

class EdirProfile {
  static edit(context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            child: BlocBuilder<DataCubit, DataState>(
              builder: (context, state) {
                var cubit = DataCubit.get(context);
                return Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 150, // تحديد ارتفاع مناسب للحاوية
                        child: Stack(
                          alignment:
                              Alignment.center, // محاذاة العناصر في المركز
                          children: [
                            Visibility(
                              visible: cubit.photo == null,
                              replacement: CircleAvatar(
                                radius: 50,
                                backgroundImage: cubit.photo != null &&
                                        cubit.photo!.path.isNotEmpty
                                    ? Image.file(
                                        File(cubit.photo!.path),
                                      ).image
                                    : const AssetImage(
                                        'assets/icons/Ellipse 12.png'), // استبدال بصورة افتراضية
                              ),
                              child: CircleAvatar(
                                radius: 50,
                                child: Image.asset(
                                  'assets/icons/Ellipse 12.png',
                                  height: 100,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 130,
                              child: IconButton(
                                onPressed: () {
                                  cubit.picImage();
                                  // حدد ماذا تفعل عند النقر، مثل فتح الكاميرا
                                },
                                icon: const Icon(Icons.camera_enhance_sharp),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        controller: DataCubit.get(context).fristName,
                        validator: (value) {
                          if ((value ?? '').trim().isEmpty) {
                            return LocaleKeys.firsNameError.tr();
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: LocaleKeys.firstName.tr(),
                            suffixIcon: BlocBuilder<DataCubit, DataState>(
                              builder: (context, state) {
                                return cubit
                                        .trueMarkButton(cubit.fristName.text)
                                    ? const Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.green,
                                      )
                                    : const Icon(Icons.check_circle_outline);
                              },
                            )),
                      ),
                      TextFormField(
                        controller: DataCubit.get(context).lastName,
                        validator: (value) {
                          if ((value ?? '').trim().isEmpty) {
                            return LocaleKeys.lastNameError.tr();
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: LocaleKeys.lastName.tr(),
                            suffixIcon: BlocBuilder<DataCubit, DataState>(
                              builder: (context, state) {
                                return cubit.trueMarkButton(cubit.lastName.text)
                                    ? const Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.green,
                                      )
                                    : const Icon(Icons.check_circle_outline);
                              },
                            )),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.addImageTOfireStorage();
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          actions: const [],
        );
      },
    );
  }
}
