import 'package:flutter/material.dart';

class BacteriaInputList extends StatelessWidget {
  const BacteriaInputList({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Bacterias"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyleExample(
                  name: 'Listado de bacterias',
                  style: textTheme.headlineSmall!),
              RadioExample(),
              SizedBox(
                width: width,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/antibiotic');
                    },
                    child: const Text("Siguiente")),
              )
            ],
          ),
        ),
      ),
    );
  }
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

enum BacteriaName {
  escherichiaColi('Escherichia coli'),
  klebsiella('Klebsiella'),
  serrati('Serrati'),
  enterobacter('Enterobacter'),
  pseudomonas('Pseudomonas'),
  citrobacter('Citrobacter'),
  aeromonas('Aeromonas'),
  morganella('Morganella'),
  stenotrophomonasMaltophilia('Stenotrophomonas maltophilia'),
  acinetobacter('Acinetobacter'),
  proteusMirabilis('Proteus mirabilis'),
  proteusVulgaris('Proteus vulgaris');

  const BacteriaName(this.option);
  final String option;
}

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  BacteriaName? _bacteriaName = BacteriaName.escherichiaColi;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (BacteriaName bacteriaName in BacteriaName.values)
          ListTile(
            title: Text(bacteriaName.option),
            leading: Radio<BacteriaName>(
              value: bacteriaName,
              groupValue: _bacteriaName,
              onChanged: (BacteriaName? value) {
                setState(() {
                  _bacteriaName = value;
                });
              },
            ),
          ),
      ],
    );
  }
}
