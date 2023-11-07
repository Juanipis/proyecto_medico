import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:proyecto_medico/models/bacterium_model.dart';

class BacteriumRepository {
  String endpoint = dotenv.env['API_ENDPOINT']!;
  String path = dotenv.env['BACTERIUMLIST_PATH']!;

  Future<List<BacteriumModel>> getBacteriums() async {
    Response response = await get(Uri.parse(endpoint + path));
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
