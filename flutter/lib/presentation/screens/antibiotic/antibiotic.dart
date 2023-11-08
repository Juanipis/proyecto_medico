// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_medico/models/antibiotic_model.dart';
import 'package:proyecto_medico/models/data_model.dart';
import 'package:proyecto_medico/presentation/screens/results/results.dart';
import 'package:proyecto_medico/repositories/antibiotic_repository.dart';

class Antibiotic extends StatefulWidget {
  const Antibiotic({super.key});

  @override
  State<Antibiotic> createState() => _AntibioticState();
}

class _AntibioticState extends State<Antibiotic> {
  List<AntibioticModel> _antibiotics = [];
  List<TextEditingController> _controllers = [];
  List<String> _selectedOptions = [];
  bool _isLoading = true;
  List<String> _options = ['<=', '>=', '='];

  @override
  void initState() {
    super.initState();
    _loadAntibiotics();
  }

  Future<void> _loadAntibiotics() async {
    var _errorMessage;
    try {
      AntibioticRepository repository = AntibioticRepository();
      List<AntibioticModel> antibiotics = await repository.getAntibiotics();
      setState(() {
        _antibiotics = antibiotics;
        _isLoading = false;
      });
    } catch (e) {
      // Handle the exception, e.g., show an error message
      print('Error loading antibiotics: $e');
      setState(() {
        _isLoading = false;
        _errorMessage = e
            .toString(); // Asegúrate de tener una variable para manejar los mensajes de error.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Antibióticos"),
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              // Asegúrate de que todos los datos necesarios están listos antes de navegar
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ResultsScreen()),
              );
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _antibiotics.length,
                      itemBuilder: (context, index) {
                        return _buildAntibioticInput(index);
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _onNextPressed,
                    child: const Text('Siguiente'),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildAntibioticInput(int index) {
    AntibioticModel antibiotic = _antibiotics[index];
    // Asegúrate de que tienes un controlador y una opción seleccionada para cada índice
    if (_controllers.length <= index) {
      _controllers.add(TextEditingController());
      _selectedOptions.add('<=');
    }
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E3E7), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(antibiotic.name ?? 'Nombre no disponible'),
            ),
            DropdownButton<String>(
              value: _selectedOptions[index],
              items: _options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (String? selectedOption) {
                setState(() {
                  _selectedOptions[index] = selectedOption!;
                });
              },
            ),
            // Padding
            const SizedBox(width: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: TextField(
                controller: _controllers[index],
                decoration: const InputDecoration(
                  labelText: 'MIC',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Asegúrate de disponer los controladores cuando el estado se destruya
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onNextPressed() {
    bool allFieldsValid = true;
    Map<String, Map<String, dynamic>> antibioticsData = {};

    for (int i = 0; i < _antibiotics.length; i++) {
      String quantity = _controllers[i].text;
      if (quantity.isEmpty) {
        allFieldsValid = false;
        break;
      }
      antibioticsData['${_antibiotics[i].id}'] = {
        "quantity": int.parse(quantity),
        "operator": _selectedOptions[i],
      };
    }

    if (allFieldsValid) {
      // Actualiza el UserDataProvider con los datos de los antibióticos
      // Necesitarás tener acceso al UserDataProvider, asegúrate de tenerlo disponible en el contexto
      Provider.of<UserDataProvider>(context, listen: false)
          .updateAntibiotics(antibioticsData);

      // Navega a la pantalla de resultados
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ResultsScreen()));
    } else {
      // Muestra un mensaje de error
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text(
              'Por favor, rellena todos los campos de los antibióticos.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }
}
