import 'package:proyecto_medico/preference/preferences_utils.dart';

class Storage {
  // Gets
  static Future<String?> getSex() async {
    return await PreferencesUtils.getString("sex");
  }

  static Future<String?> getWeight() async {
    return await PreferencesUtils.getString("weight");
  }

  static Future<String?> getAge() async {
    return await PreferencesUtils.getString("age");
  }

  static Future<bool?> getCreatinine() async {
    return await PreferencesUtils.getBool("creatinine");
  }

  static Future<bool?> getPenicillinAllergy() async {
    return await PreferencesUtils.getBool("penicillin");
  }

  static Future<bool?> getCAPD() async {
    return await PreferencesUtils.getBool("CAPD");
  }

  static Future<bool?> getCRRT() async {
    return await PreferencesUtils.getBool("CRRT");
  }

  static Future<bool?> getHemodialysis() async {
    return await PreferencesUtils.getBool("hemodialysis");
  }

  // Sets
  static Future<void> setSex(String value) async {
    await PreferencesUtils.setString("sex", value);
  }

  static Future<void> setWeight(String value) async {
    await PreferencesUtils.setString("weight", value);
  }

  static Future<void> setAge(String value) async {
    await PreferencesUtils.setString("age", value);
  }

  static Future<void> setPenicillinAllergy(value) async {
    await PreferencesUtils.setBool("penicillin", value);
  }

  static Future<void> setCreatinine(value) async {
    await PreferencesUtils.setString("creatinine", value);
  }

  static Future<void> setCAPD(value) async {
    await PreferencesUtils.setBool("CAPD", value);
  }

  static Future<void> setCRRT(value) async {
    await PreferencesUtils.setBool("CRRT", value);
  }

  static Future<void> setHemodialysis(value) async {
    await PreferencesUtils.setBool("hemodialysis", value);
  }

  static Future<void> setSelectedInfection(int value) async {
    await PreferencesUtils.setInt("infection", value);
  }
}
