class Vital {
  String id;
  final String bloodSugar;
  final String bloodPressure;
  final String bodyTemp;

  Vital(
      {this.id = '',
      required this.bloodSugar,
      required this.bloodPressure,
      required this.bodyTemp});

  Map<String, dynamic> toJson() => {
        'id': id,
        'bloodSugar': bloodSugar,
        'bloodPressure': bloodPressure,
        'bodyTemp': bodyTemp
      };

  static Vital fromJson(Map<String, dynamic> json) => Vital(
      id: json["id"],
      bloodSugar: json["bloodSugar"],
      bloodPressure: json["bloodPressure"],
      bodyTemp: json['bodyTemp']);
}
