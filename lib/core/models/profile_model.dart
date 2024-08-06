import 'package:password_manager/core/firebase/firebase.dart';

class ProfileModel {
  final String? fristName;
  final String? lastName;
  final String? mobileNumber;
  final String? image;

  ProfileModel({this.fristName, this.lastName, this.mobileNumber, this.image});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      fristName: json[FirebaseKeys.fristName],
      lastName: json[FirebaseKeys.lastName],
      mobileNumber: json[FirebaseKeys.mobileNumber],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[FirebaseKeys.fristName] = fristName;
    data[FirebaseKeys.lastName] = lastName;
    data[FirebaseKeys.mobileNumber] = mobileNumber;
    data['image'] = image;

    return data;
  }
}
