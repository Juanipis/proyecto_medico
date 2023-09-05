import 'package:flutter/material.dart';

class Antibiotic extends StatefulWidget {
  const Antibiotic({super.key});

  @override
  State<Antibiotic> createState() => _AntibioticState();
}

class TextStyleExample extends StatelessWidget {
  const TextStyleExample({
    super.key,
    required this.name,
    required this.style,
  });
  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(name, style: style),
    );
  }
}

class _AntibioticState extends State<Antibiotic> {
  String _selectedOption = '≤';
  TextEditingController _textFieldController = TextEditingController();
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
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Antibioticos"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: TextStyleExample(
                    name: 'Escherichia Coli', style: textTheme.displayMedium!)),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFE0E3E7), width: 2)),
                child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Text('Amikacin')),
                          SizedBox(
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
                          Spacer(),
                          Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                  child: TextField(
                                      controller: _textFieldController,
                                      decoration: InputDecoration(
                                        labelText: 'MIC',
                                      ))))
                        ]))),
            Spacer(),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFE0E3E7), width: 2)),
                child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Text('Ampicilin')),
                          SizedBox(
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
                          Spacer(),
                          Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                  child: TextField(
                                      controller: _textFieldController,
                                      decoration: InputDecoration(
                                        labelText: 'MIC',
                                      ))))
                        ]))),
            Spacer(),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFE0E3E7), width: 2)),
                child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Text('Aztreonam')),
                          SizedBox(
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
                          Spacer(),
                          Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                  child: TextField(
                                      controller: _textFieldController,
                                      decoration: InputDecoration(
                                        labelText: 'MIC',
                                      ))))
                        ]))),
            Spacer(),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFE0E3E7), width: 2)),
                child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Text('Aztreonam')),
                          SizedBox(
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
                          Spacer(),
                          Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                  child: TextField(
                                      controller: _textFieldController,
                                      decoration: InputDecoration(
                                        labelText: 'MIC',
                                      ))))
                        ]))),
            Spacer(),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFFE0E3E7), width: 2)),
                child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(6, 6, 6, 6),
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Text('Ampicilin/Sulbactan')),
                          SizedBox(
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
                          Spacer(),
                          Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                  child: TextField(
                                      controller: _textFieldController,
                                      decoration: InputDecoration(
                                        labelText: 'MIC',
                                      ))))
                        ]))),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/results');
                },
                child: Text("Continuar"),
              ),
            )
          ]),
        ));
  }
}
