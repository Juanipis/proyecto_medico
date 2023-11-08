import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_medico/models/antibiotic_model.dart';

class AntibioticRepository {
  final String? endpoint = dotenv.env['API_ENDPOINT'];
  final String? path = dotenv.env['ANTIBIOTICLIST_PATH'];

  Future<List<AntibioticModel>> getAntibiotics() async {
    // Verifica que las variables de entorno no sean null
    if (endpoint == null || path == null) {
      throw Exception('API endpoint or path is not defined in .env file');
    }

    final fullUrl =
        '$endpoint$path'; // Usa interpolación de cadenas en lugar de +

    final response = await http.get(Uri.parse(fullUrl));

    if (response.statusCode == 200) {
      // Verifica que el cuerpo de la respuesta no sea null
      if (response.body.isNotEmpty) {
        try {
          final List<dynamic> result = json.decode(response.body);
          return result.map((data) => AntibioticModel.fromJson(data)).toList();
        } catch (e) {
          // Maneja cualquier error de decodificación JSON
          throw Exception('Error parsing Antibiotics data: $e');
        }
      } else {
        // Maneja el caso en que el cuerpo de la respuesta está vacío
        throw Exception('Response body is empty');
      }
    } else {
      // Maneja los diferentes códigos de estado HTTP
      throw Exception(
          'Failed to load Antibiotics with status code: ${response.statusCode}');
    }
  }
}
