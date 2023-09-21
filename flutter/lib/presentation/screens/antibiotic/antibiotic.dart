import 'package:flutter/material.dart';
import 'package:proyecto_medico/presentation/text/tittle_material.dart';

class Antibiotic extends StatefulWidget {
  const Antibiotic({super.key});

  @override
  State<Antibiotic> createState() => _AntibioticState();
}

class _AntibioticState extends State<Antibiotic> {
  String _selectedOption = '≤';
  final TextEditingController _textFieldController = TextEditingController();
  final List<String> _options = ['≤', '≥', '='];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text("Antibioticos"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: MaterialText(
                    name: 'Escherichia Coli', style: textTheme.displayMedium!)),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE0E3E7), width: 2)),
                child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Text('Amikacin')),
                          const SizedBox(
                            width: 50,
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
                              }),
                          const Spacer(),
                          Align(
                              alignment: const AlignmentDirectional(0, 1),
                              child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                  child: TextField(
                                      controller: _textFieldController,
                                      decoration: const InputDecoration(
                                        labelText: 'MIC',
                                      ))))
                        ]))),
            const Spacer(),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE0E3E7), width: 2)),
                child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Text('Ampicilin')),
                          const SizedBox(
                            width: 50,
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
                              }),
                          const Spacer(),
                          Align(
                              alignment: const AlignmentDirectional(0, 1),
                              child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                  child: TextField(
                                      controller: _textFieldController,
                                      decoration: const InputDecoration(
                                        labelText: 'MIC',
                                      ))))
                        ]))),
            const Spacer(),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE0E3E7), width: 2)),
                child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Text('Aztreonam')),
                          const SizedBox(
                            width: 50,
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
                              }),
                          const Spacer(),
                          Align(
                              alignment: const AlignmentDirectional(0, 1),
                              child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                  child: TextField(
                                      controller: _textFieldController,
                                      decoration: const InputDecoration(
                                        labelText: 'MIC',
                                      ))))
                        ]))),
            const Spacer(),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE0E3E7), width: 2)),
                child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Text('Aztreonam')),
                          const SizedBox(
                            width: 50,
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
                              }),
                          const Spacer(),
                          Align(
                              alignment: const AlignmentDirectional(0, 1),
                              child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                  child: TextField(
                                      controller: _textFieldController,
                                      decoration: const InputDecoration(
                                        labelText: 'MIC',
                                      ))))
                        ]))),
            const Spacer(),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE0E3E7), width: 2)),
                child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Text('Ampicilin/Sulbactan')),
                          const SizedBox(
                            width: 50,
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
                              }),
                          const Spacer(),
                          Align(
                              alignment: const AlignmentDirectional(0, 1),
                              child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                  child: TextField(
                                      controller: _textFieldController,
                                      decoration: const InputDecoration(
                                        labelText: 'MIC',
                                      ))))
                        ]))),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/results');
                },
                child: const Text("Continuar"),
              ),
            )
          ]),
        ));
  }
}
