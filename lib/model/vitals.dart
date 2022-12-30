class VitalsField {
  static const createdTime = 'createdTime';
}

class Vital {
  String id;
  final String bloodSugar;
  final String bloodPressure;
  final String bodyTemperature;

  Vital(
      {required this.bloodSugar,
      required this.bodyTemperature,
      required this.id,
      required this.bloodPressure});

  Vital.fromData(Map<String, dynamic> data)
      : id = data['id'],
        bloodSugar = data["bloodSugar"],
        bodyTemperature = data["bodyTemperature"],
        bloodPressure = data["bloodPressure"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "bloodSugar": bloodSugar,
      "bodyTemperature": bodyTemperature,
      "bloodPressure": bloodPressure,
    };
  }
}
