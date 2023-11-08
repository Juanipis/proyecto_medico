// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:proyecto_medico/models/antibiotic_model.dart';
import 'package:proyecto_medico/repositories/antibiotic_repository.dart';

class Antibiotic extends StatefulWidget {
  const Antibiotic({super.key});

  @override
  State<Antibiotic> createState() => _AntibioticState();
}

class _AntibioticState extends State<Antibiotic> {
  List<AntibioticModel> _antibiotics = [];
  bool _isLoading = true;

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
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: _antibiotics.length,
                itemBuilder: (context, index) {
                  return _buildAntibioticInput(context, _antibiotics[index]);
                },
              ),
            ),
    );
  }

  Widget _buildAntibioticInput(
      BuildContext context, AntibioticModel antibiotic) {
    TextEditingController _textFieldController = TextEditingController();
    String _selectedOption = '≤';
    List<String> _options = ['≤', '≥', '='];

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
              value: _selectedOption,
              items: _options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (String? selectedOption) {
                setState(() {
                  _selectedOption = selectedOption!;
                });
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: TextField(
                controller: _textFieldController,
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
}
