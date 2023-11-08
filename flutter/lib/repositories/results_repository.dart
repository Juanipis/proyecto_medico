import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:proyecto_medico/models/data_model.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_medico/models/result_model.dart';

String enpoint = dotenv.env['API_ENDPOINT']!;
String savePatient = dotenv.env['PATIENT_PATH']!;
String saveResult = dotenv.env['RESULT_PATH_SAVE']!;
String getResultByIDEndpoint = dotenv.env['RESULT_PATH_GET_ID']!;

class ResultsRepository {
  Future<int> postPatientData(UserData patientData) async {
    var url = Uri.parse(enpoint + savePatient);
    var body = {
      "sex": (patientData.sex == 0
          ? 'M'
          : patientData.sex == 1
              ? 'F'
              : 'O'),
      "weight": patientData.weight,
      "age": patientData.age,
      "creatinine": patientData.creatinine,
      "hemodialisis": patientData.hemodialysis,
      "capd": patientData.capd,
      "crrt": patientData.crrt,
      "infectionLocation": {
        "id": patientData.infection,
      }
    };

    var response = await http.post(url,
        body: jsonEncode(body), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      var patientId = responseData['id'];
      return patientId;
    } else {
      return -1;
    }
  }

  Future<int> postResult(UserData userData, int patientId) async {
    var url = Uri.parse(enpoint + saveResult);
    var body = {
      "bacterium": {
        "id": userData.bacterium,
      },
      "patient": {
        "id": patientId,
      },
      "result": "Mock information",
      "antibioticsInfoJson": userData.antibiotics,
    };

    var response = await http.post(url,
        body: jsonEncode(body), headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      var id = responseData['id'];
      return id;
    } else {
      return -1;
    }
  }

  Future<ResultData> getResultByID(int id) async {
    var url = Uri.parse('$enpoint$getResultByIDEndpoint/$id');

    var response =
        await http.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return ResultData.fromJson(responseData);
    } else {
      throw Exception('Failed to load result');
    }
  }
}
