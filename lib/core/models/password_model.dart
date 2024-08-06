class PasswordModel {
  final String? icon;
  final String? name;
  final int? index;
  final int? stringth;
  final String? link;
  final String? userId;
  final String? password;
  final bool? outoFill;

  PasswordModel({
    required this.icon,
    required this.name,
    required this.index,
    required this.link,
    required this.userId,
    required this.password,
    required this.outoFill,
    required this.stringth,
  });

  factory PasswordModel.fromJson(Map<String, dynamic> json) {
    return PasswordModel(
      icon: json['icon'],
      name: json['name'],
      index: json['index'] as int?,
      link: json['link'],
      userId: json['userId'],
      password: json['password'],
      outoFill: json['outoFill'],
      stringth: json['stringth'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = icon;
    data['name'] = name;
    data['index'] = index;
    data['link'] = link;
    data['userId'] = userId;
    data['password'] = password;
    data['outoFill'] = outoFill;
    data['stringth'] = stringth;

    return data;
  }
}
