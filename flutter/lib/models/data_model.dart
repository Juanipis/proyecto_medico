import 'package:flutter/material.dart';

class UserData {
  String? age;
  String? weight;
  int? sex;
  String? creatinine;
  bool? hemodialysis;
  bool? penicillin;
  bool? crrt;
  bool? capd;
  int? infection;
  int? bacterium;
  String? creatinineClearance;
  Map<String, Map<String, dynamic>>? antibiotics;
  UserData(
      {this.sex,
      this.weight,
      this.age,
      this.creatinine,
      this.hemodialysis,
      this.penicillin,
      this.crrt,
      this.capd,
      this.infection,
      this.bacterium,
      this.creatinineClearance,
      this.antibiotics});

  void setBacterium(int? value) {
    bacterium = value;
  }

  void setAntibiotics(Map<String, Map<String, dynamic>> newAntibiotics) {
    antibiotics = newAntibiotics;
  }
}

class UserDataProvider with ChangeNotifier {
  UserData? _userData;

  UserData? get userData => _userData;

  void setUserData(UserData userData) {
    _userData = userData;
    notifyListeners();
  }

  void updateAntibiotics(Map<String, Map<String, dynamic>> antibiotics) {
    if (_userData != null) {
      _userData!.setAntibiotics(antibiotics);
      notifyListeners();
    }
  }
}
