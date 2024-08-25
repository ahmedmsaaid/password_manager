import 'package:flutter/material.dart';
import 'package:password_manager/core/models/password_model.dart';
import 'package:password_manager/core/widgets/password.dart';

class SearchWidget {
  static Widget item(
    List<PasswordModel> passwordModel, {
    String? password,
  }) {
    if (password == null || password.length < 2) {
      return Center(
          child: SizedBox(
              height: 40, child: CircularProgressIndicator.adaptive()));
    }

    final filteredModels = passwordModel
        .where((models) =>
            (models.name != null &&
                models.name!.startsWith(password.substring(0, 2))) ||
            (models.userId != null &&
                models.userId!.startsWith(password.substring(0, 2))))
        .toList();

    if (filteredModels.isNotEmpty) {
      return ListView.separated(

        itemBuilder: (context, index) => Password(
          model: filteredModels[index],
        ),
        itemCount: filteredModels.length,
        separatorBuilder: (context, index) => SizedBox(height: 1),
      );
    } else {
      return Center(child: Text('No Password Found'));
    }
  }
}
