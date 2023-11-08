import 'package:flutter/material.dart';

class AntibioticModel {
  final int id;
  final String name;

  AntibioticModel({
    required this.id,
    required this.name,
  });

  factory AntibioticModel.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null || json['name'] == null) {
      throw Exception('Faltan datos para un AntibioticModel');
    }
    return AntibioticModel(
      id: json['id'],
      name: json['name'],
      // Otros campos
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class UserDataProvider with ChangeNotifier {
  // ... (otros métodos y propiedades)

  Map<String, AntibioticModel>? _antibiotics;

  Map<String, AntibioticModel>? get antibiotics => _antibiotics;

  void setAntibiotics(Map<String, AntibioticModel> antibiotics) {
    _antibiotics = antibiotics;
    notifyListeners();
  }
}
