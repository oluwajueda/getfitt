class UserHealth {
  String uid;
  final String dateOfBirth;
  final String diabetic;
  final String isDiabeticControlled;
  final String hypertensive;
  final String isHypertensionControlled;

  UserHealth(
      {this.uid = '',
      required this.dateOfBirth,
      required this.isDiabeticControlled,
      required this.diabetic,
      required this.hypertensive,
      required this.isHypertensionControlled});

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "dateOfBirth": dateOfBirth,
        "diabetic": diabetic,
        "isDiabeticControlled": isDiabeticControlled,
        "hypertensive": hypertensive,
        "isHypertensionControlled": isHypertensionControlled
      };

  static UserHealth fromJson(Map<String, dynamic> json) => UserHealth(
        uid: json["uid"],
        dateOfBirth: json["dateOfBirth"],
        diabetic: json["diabetic"],
        isDiabeticControlled: json["isDiabeticControlled"],
        hypertensive: json["hypertensive"],
        isHypertensionControlled: json['isHypertensionControlled'],
      );
}
