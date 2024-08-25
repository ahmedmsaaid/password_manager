import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_manager/view/view_model/cubits/home/home_cubit.dart';
import 'package:password_manager/view/view_model/data/cubit/data_cubit.dart';
import '../../../translation/locate_keys.g.dart';

class NewRecord extends StatelessWidget {
  const NewRecord({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    var cubit = DataCubit.get(context);
    return BlocBuilder<DataCubit, DataState>(builder: (context, state) {
      var model = HomeCubit.get(context);

      return Scaffold(
        backgroundColor: model.darkMood ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: model.darkMood ? Colors.black : Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: model.darkMood ? Colors.white : Colors.black,
            ),
            color: Colors.black,
          ),
          centerTitle: true,
          title: Text(
            LocaleKeys.newRecord.tr(),
            style:
                TextStyle(color: model.darkMood ? Colors.white : Colors.black),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      LocaleKeys.name.tr(),
                      style: TextStyle(
                          fontSize: 20,
                          color: model.darkMood ? Colors.white : Colors.black),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if ((value ?? '').trim().isEmpty) {
                            return LocaleKeys.nameFailedError.tr();
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(
                          color: HomeCubit.get(context).darkMood
                              ? Colors.white
                              : Colors.black, // تغيير لون النص هنا
                        ),
                        controller: DataCubit.get(context).websiteNameController,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          labelText: LocaleKeys.nameFailed.tr(),
                          suffixIcon: BlocBuilder<DataCubit, DataState>(
                            builder: (context, state) {
                              return cubit.trueMarkButton(
                                      cubit.websiteNameController.text)
                                  ? const Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.green,
                                    )
                                  : const Icon(Icons.check_circle_outline);
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30.w,
                    ),
                    Text(
                      LocaleKeys.userId.tr(),
                      style: TextStyle(
                          fontSize: 20,
                          color: model.darkMood ? Colors.white : Colors.black),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if ((value ?? '').trim().isEmpty) {
                            return LocaleKeys.userIdFailedError.tr();
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(
                          color: HomeCubit.get(context).darkMood
                              ? Colors.white
                              : Colors.black, // تغيير لون النص هنا
                        ),
                        controller: cubit.userIdController,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(),
                          labelText: LocaleKeys.userIdFailed.tr(),
                          suffixIcon: BlocBuilder<DataCubit, DataState>(
                            builder: (context, state) {
                              return cubit
                                      .trueMarkButton(cubit.userIdController.text)
                                  ? const Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.green,
                                    )
                                  : const Icon(Icons.check_circle_outline);
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Divider(
                  color: Colors.grey.withOpacity(.3),
                  indent: 25,
                  endIndent: 25,
                  thickness: 2,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  LocaleKeys.password.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      color: model.darkMood ? Colors.white : Colors.black),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if ((value ?? '').trim().isEmpty) {
                            return LocaleKeys.passwordError.tr();
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(
                          color: HomeCubit.get(context).darkMood
                              ? Colors.white
                              : Colors.black, // تغيير لون النص هنا
                        ),
                        controller: cubit.passwordController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: LocaleKeys.password.tr(),
                          suffixIcon: IconButton(
                              onPressed: () {
                                cubit.genetarePassword(
                                    letters: cubit.letters,
                                    numbers: cubit.numbers,
                                    passwordLength: cubit.passwordLength,
                                    specialChar: cubit.specialChar,
                                    uppercase: cubit.uppercase);
                              },
                              icon: const Icon(Icons.refresh)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    BlocBuilder<DataCubit, DataState>(
                      builder: (context, state) {
                        return Expanded(
                          child: LinearProgressIndicator(
                            value: cubit.stringthChick(),
                            color:
                                cubit.linearProgressColor(cubit.stringthChick()),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                  ],
                ),
                BlocBuilder<DataCubit, DataState>(
                  builder: (context, state) {
                    return Container(
                      padding: EdgeInsets.all(20.sp),
                      child: Column(
                        children: [
                          Row(children: [
                            Row(
                              children: [
                                Text(
                                  LocaleKeys.length.tr(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: model.darkMood
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Text(
                                  '${cubit.passwordLength.round()}',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Slider(
                                value: cubit.passwordLength,
                                min: 0,
                                max: 30,
                                divisions: 100,
                                thumbColor: Colors.white,
                                activeColor: Colors.blue,
                                inactiveColor: Colors.grey,
                                onChanged: (value) {
                                  cubit.changePasswordLength(value);
                                },
                              ),
                            ),
                          ]),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    LocaleKeys.numbers.tr(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: model.darkMood
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Checkbox(
                                      value: cubit.numbers,
                                      onChanged: (value) {
                                        cubit.numbersCheckbox(value);
                                      },
                                      activeColor: Colors.blueAccent),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    LocaleKeys.symbols.tr(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: model.darkMood
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Checkbox(
                                      value: cubit.specialChar,
                                      onChanged: (value) {
                                        cubit.specialCharCheckbox(value);
                                      },
                                      activeColor: Colors.blueAccent),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    LocaleKeys.lowercase.tr(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: model.darkMood
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 45,
                                  ),
                                  Checkbox(
                                      value: true,
                                      onChanged: (value) {},
                                      activeColor: Colors.blueAccent),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    LocaleKeys.uppercase.tr(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: model.darkMood
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Checkbox(
                                    value: cubit.uppercase,
                                    onChanged: (value) {
                                      cubit.ubberCaswCheckbox(value);
                                    },
                                    activeColor: Colors.blueAccent,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                        side: BorderSide(
                                            color: Colors.black.withOpacity(.2))),
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    cubit.passwordController.clear();
                                    cubit.websiteNameController.clear();
                                    cubit.userIdController.clear();

                                    // cubit.genetarePassword(
                                    //     letters: cubit.letters,
                                    //     numbers: cubit.numbers,
                                    //     passwordLength: cubit.passwordLength,
                                    //     specialChar: cubit.specialChar,
                                    //     uppercase: cubit.uppercase);
                                  },
                                  child: Text(
                                    LocaleKeys.clear.tr(),
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                        side: BorderSide(
                                            color: Colors.black.withOpacity(.2))),
                                    backgroundColor: Colors.blueGrey,
                                  ),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      DataCubit.get(context).addDataToFirestore();
                                      DataCubit.get(context).getDataFireStore();
                                      DataCubit.get(context).chickAnalysis();
                                      cubit.clear();

                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Done Add Password'),
                                          backgroundColor: Colors.green,
                                        ),
                                      );
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Text(
                                    LocaleKeys.savePassword.tr(),
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
