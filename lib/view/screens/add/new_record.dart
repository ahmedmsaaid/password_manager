import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/navigator.dart';
import '../../../core/widgets/widgets.dart';
import '../../../translation/locate_keys.g.dart';

class NewRecord extends StatelessWidget {
  const NewRecord({super.key});


  @override
  Widget build(BuildContext context) {
    TextEditingController nameController=TextEditingController();
    TextEditingController userIdController=TextEditingController();
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},

          icon:Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(LocaleKeys.newRecord.tr()),

      ),body: ListView(
      children: [
        Row(
          children: [
            Text(LocaleKeys.name.tr()),
                   ],
        ),

      ],
    ),
    );
  }
}
