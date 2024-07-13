import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:password_manager/view/screens/add/new_record.dart';
import 'package:password_manager/view/screens/home/profile/profile_screen.dart';

import '../../../../core/widgets/navigator.dart';
import '../../../../core/widgets/selection.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../../translation/locate_keys.g.dart';
import '../../details/details.dart';
import '../settings_screen/setting_screen.dart';

class Analysis extends StatelessWidget {
  const Analysis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.person_outline_outlined,
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(LocaleKeys.security.tr()),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: (){Navigation.push(context, NewRecord());},
              icon:Icon(Icons.add,
                size: 30,),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [

          Padding(
          padding: const EdgeInsets.fromLTRB(100.0,100.0,100.0,20),
          child: Stack(
            children: [
              SizedBox(
                        width: 400,
              height: 160,
              child: CircularProgressIndicator(

                value: 1,
                strokeWidth: 20.0,
                backgroundColor: Colors.black,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            ),
              SizedBox(
                width: 400,
                height: 160,
                child: CircularProgressIndicator(

                  value: 0.82,
                  strokeWidth: 14.0,
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,65,10,20),
                child: Align(alignment:AlignmentDirectional.center,
                    child: Text('82 %',style: TextStyle(fontWeight: FontWeight.bold),)),
              )]
          ),
                      ),
          Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('82% secured',style: TextStyle(fontSize: 18),),
            ],
          ),
          SizedBox(height: 15,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  
                    border: Border.all(
                  color: Colors.black87
                ),

                  borderRadius: BorderRadius.circular(12)

                ),
                child: Column(
                  children: [
                    Text('82'),Text('Safe'),
                    
                  ],
                ),
              ),
              Container(padding: EdgeInsets.all(12),
                decoration: BoxDecoration(

                    border: Border.all(
                        color: Colors.black87
                    ),

                    borderRadius: BorderRadius.circular(12)

                ),
                child: Column(
                  children: [
                    Text('12'),Text('wake'),

                  ],
                ),
              ),
              Container(padding: EdgeInsets.all(12),
                decoration: BoxDecoration(

                    border: Border.all(
                        color: Colors.black87
                    ),

                    borderRadius: BorderRadius.circular(12)

                ),
                child: Column(
                  children: [
                    Text('8'),Text('resk'),

                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15,),
          Selection(text: LocaleKeys.analysis.tr() ,widget: Icon(Icons.filter_list_rounded),),
          Widgets.itemsWithAnalysis(context,Details()),
        ],
      ),
    );
  }
}
