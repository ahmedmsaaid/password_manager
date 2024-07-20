import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/navigator.dart';
import '../../../core/widgets/widgets.dart';
import '../../../translation/locate_keys.g.dart';

class NewRecord extends StatelessWidget {
  const NewRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(LocaleKeys.newRecord.tr()),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30.w,
              ),
              Text(
                LocaleKeys.name.tr(),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 30.w,
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: LocaleKeys.nameFailed.tr(),
                    suffixIcon: Visibility(
                        visible: false,
                        replacement: Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                        ),
                        child: Icon(Icons.check_circle_outline)),
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
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 30.w,
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: LocaleKeys.userIdFailed.tr(),
                    suffixIcon: Visibility(
                        visible: false,
                        replacement: Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                        ),
                        child: Icon(Icons.check_circle_outline)),
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
            style: TextStyle(fontSize: 20.sp),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: LocaleKeys.password.tr(),
                    suffixIcon:
                        IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
                  ),
                ),

              ),

              SizedBox(
                width: 25,

              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Expanded(
                child:  LinearProgressIndicator(
                  value: 0.82 ,
                  color: Colors.green,
                ),

              ),

              SizedBox(
                width: 25,

              ),
            ],
          ),


          Container(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              children: [
                Row(
                    children: [
                  Row(
                    children: [
                      Text(
                        LocaleKeys.length.tr(),
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        '12',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Slider(
                      value: 12,
                      min: 0,
                      max: 30,
                      divisions: 100,
                      thumbColor: Colors.white,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey,
                      onChanged: (value) {},
                    ),
                  ),

                ]),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          LocaleKeys.numbers.tr(),
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                       Checkbox(value: true, onChanged: (value){},activeColor: Colors.blueAccent),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          LocaleKeys.symbols.tr(),
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Checkbox(value: false, onChanged: (value){},activeColor: Colors.blueAccent),
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
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                       Checkbox(value: true, onChanged: (value){},activeColor: Colors.blueAccent),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          LocaleKeys.uppercase.tr(),
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Checkbox(value: true, onChanged: (value){},activeColor: Colors.blueAccent,),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp),side: BorderSide(
                              color: Colors.black.withOpacity(.2)
                          )),backgroundColor: Colors.white,
                      
                        ),
                        onPressed: () {},
                        child: Text(LocaleKeys.regenerate.tr(),style: TextStyle(color: Colors.black87,fontSize: 12.sp,fontWeight: FontWeight.normal),),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp),side: BorderSide(
                              color: Colors.black.withOpacity(.2)
                          )),backgroundColor: Colors.white,
                      
                        ),
                        onPressed: () {},
                        child: Text(LocaleKeys.savePassword.tr(),style: TextStyle(color: Colors.black87,fontSize: 12.sp,fontWeight: FontWeight.normal),),
                      ),
                    ),
  ],
                ),
                SizedBox(height: 20,),
                Text(LocaleKeys.or.tr(),textAlign: TextAlign.center,style: TextStyle(fontSize: 18.sp),),
                SizedBox(height: 30,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp),side: BorderSide(
                        color: Colors.black.withOpacity(.2)
                    )),backgroundColor: Colors.white,

                  ),
                  onPressed: () {},
                  child: Text(LocaleKeys.addManually.tr(),style: TextStyle(color: Colors.black87,fontSize: 12.sp,fontWeight: FontWeight.normal),),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
