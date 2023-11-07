import 'package:flutter/material.dart';

class UserData {
  String? age;
  String? weight;
  String? sex;
  String? creatinine;
  bool? hemodialysis;
  bool? penicillin;
  bool? crrt;
  bool? capd;
  int? infection;
  int? bacterium;
  String? creatinineClearance;
  UserData({this.sex,
    this.weight,
    this.age,
    this.creatinine,
    this.hemodialysis,
    this.penicillin,
    this.crrt,
    this.capd,
    this.infection,
    this.bacterium,
    this.creatinineClearance});

  void setBacterium(int? value) {
    bacterium = value;
  }
}
class UserDataProvider with ChangeNotifier {
  UserData? _userData;

  UserData? get userData => _userData;

  void setUserData(UserData userData) {
    _userData = userData;
    notifyListeners();
  }
}
