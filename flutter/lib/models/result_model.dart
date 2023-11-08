class ResultData {
  final int id;
  final Bacterium bacterium;
  final Patient patient;
  final String result;
  final Map<String, AntibioticInfo> antibioticsInfoJson;

  ResultData({
    required this.id,
    required this.bacterium,
    required this.patient,
    required this.result,
    required this.antibioticsInfoJson,
  });

  factory ResultData.fromJson(Map<String, dynamic> json) {
    return ResultData(
      id: json['id'],
      bacterium: Bacterium.fromJson(json['bacterium']),
      patient: Patient.fromJson(json['patient']),
      result: json['result'],
      antibioticsInfoJson: Map.from(json['antibioticsInfoJson'])
          .map((key, value) => MapEntry(key, AntibioticInfo.fromJson(value))),
    );
  }
}

class Bacterium {
  final int id;
  final String name;

  Bacterium({required this.id, required this.name});

  factory Bacterium.fromJson(Map<String, dynamic> json) {
    return Bacterium(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Patient {
  final int id;
  final String sex;
  final int weight;
  final int age;
  final int creatinine;
  final bool hemodialisis;
  final bool capd;
  final bool crrt;
  final InfectionLocation infectionLocation;

  Patient({
    required this.id,
    required this.sex,
    required this.weight,
    required this.age,
    required this.creatinine,
    required this.hemodialisis,
    required this.capd,
    required this.crrt,
    required this.infectionLocation,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      sex: json['sex'],
      weight: json['weight'],
      age: json['age'],
      creatinine: json['creatinine'],
      hemodialisis: json['hemodialisis'],
      capd: json['capd'],
      crrt: json['crrt'],
      infectionLocation: InfectionLocation.fromJson(json['infectionLocation']),
    );
  }
}

class InfectionLocation {
  final int id;
  final String name;

  InfectionLocation({required this.id, required this.name});

  factory InfectionLocation.fromJson(Map<String, dynamic> json) {
    return InfectionLocation(
      id: json['id'],
      name: json['name'],
    );
  }
}

class AntibioticInfo {
  final int quantity;
  final String operator;

  AntibioticInfo({required this.quantity, required this.operator});

  factory AntibioticInfo.fromJson(Map<String, dynamic> json) {
    return AntibioticInfo(
      quantity: json['quantity'],
      operator: json['operator'],
    );
  }
}
