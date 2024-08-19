import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/translation/locate_keys.g.dart';
import 'package:password_manager/view/view_model/cubits/home/home_cubit.dart';
import 'package:password_manager/view/view_model/data/cubit/data_cubit.dart';

class EditProfile {
  static edit(BuildContext context) {
    var homeCubit = HomeCubit.get(context);
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: homeCubit.darkMood ? Colors.grey : Colors.black,
              width: 2.0,
            ),
          ),
          backgroundColor: homeCubit.darkMood ? Colors.black : Colors.white,
          content: SizedBox(
            height: 350.h,
            child: BlocBuilder<DataCubit, DataState>(
              builder: (context, state) {
                var dataCubit = DataCubit.get(context);
                return Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      _buildProfileImage(context, dataCubit),
                      _buildTextFormField(
                        context: context,
                        controller: dataCubit.fristName,
                        label: LocaleKeys.firstName.tr(),
                        errorText: LocaleKeys.firsNameError.tr(),
                      ),
                      _buildTextFormField(
                        context: context,
                        controller: dataCubit.lastName,
                        label: LocaleKeys.lastName.tr(),
                        errorText: LocaleKeys.lastNameError.tr(),
                      ),
                      const SizedBox(height: 20),
                      _buildSaveButton(context, formKey, dataCubit),
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

  static Widget _buildProfileImage(BuildContext context, DataCubit cubit) {
    return SizedBox(
      height: 150.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Visibility(
            visible: cubit.photo == null,
            replacement: CircleAvatar(
              radius: 50,
              backgroundImage:
                  cubit.photo != null && cubit.photo!.path.isNotEmpty
                      ? Image.file(File(cubit.photo!.path)).image
                      : const AssetImage('assets/icons/Ellipse 12.png'),
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
              },
              icon: const Icon(Icons.camera_enhance_sharp),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildTextFormField({
    required BuildContext context,
    required TextEditingController controller,
    required String label,
    required String errorText,
  }) {
    var homeCubit = HomeCubit.get(context);
    return TextFormField(
      controller: controller,
      validator: (value) {
        if ((value ?? '').trim().isEmpty) {
          return errorText;
        }
        return null;
      },
      style: TextStyle(
        color: homeCubit.darkMood ? Colors.white : Colors.black,
      ),
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: label,
        suffixIcon: BlocBuilder<DataCubit, DataState>(
          builder: (context, state) {
            return controller.text.isNotEmpty
                ? const Icon(Icons.check_circle_outline, color: Colors.green)
                : const Icon(Icons.check_circle_outline);
          },
        ),
      ),
    );
  }

  static Widget _buildSaveButton(
      BuildContext context, GlobalKey<FormState> formKey, DataCubit cubit) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              HomeCubit.get(context).darkMood ? Colors.grey : Colors.black,
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            cubit.addImageTOfireStorage();
            Navigator.pop(context);
          }
        },
        child: Text(
          LocaleKeys.save.tr(),
          style: TextStyle(
            color:
                HomeCubit.get(context).darkMood ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
