import 'dart:convert';

import 'package:http/http.dart';
import 'package:proyecto_medico/models/bacterium_model.dart';

class BacteriumRepository {
  // TODO: Change endpoint to real endpoint
  String endpoint = "https://mocki.io/v1/d484f984-17f2-46c7-93d6-954b917570e2";

  Future<List<BacteriumModel>> getBacteriums() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = json.decode(response.body);
      return result
          .map((bacterium) => BacteriumModel.fromJson(bacterium))
          .toList();
    } else {
      throw Exception('Failed to load Bacteriums');
    }
  }
}
