import 'package:getfitts/screens/utils.dart';

class Vital {
  String id;
  final String bloodSugar;
  final String bloodPressure;
  final String bodyTemp;
  final DateTime? createdOn;

  Vital({
    this.id = '',
    required this.bloodSugar,
    required this.bloodPressure,
    required this.bodyTemp,
    required this.createdOn,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'bloodSugar': bloodSugar,
        'bloodPressure': bloodPressure,
        'bodyTemp': bodyTemp,
        "createdOn": Utils.fromDateTimeToJson(createdOn)
      };

  static Vital fromJson(Map<String, dynamic> json) => Vital(
      id: json["id"],
      bloodSugar: json["bloodSugar"],
      bloodPressure: json["bloodPressure"],
      createdOn: Utils.toDateTime(json["createdOn"]),
      bodyTemp: json['bodyTemp']);
}
