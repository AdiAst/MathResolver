import 'package:dart_eval/dart_eval.dart';
import 'package:flutter/material.dart';

import 'dart:core';

class DetailMasalah extends StatefulWidget {
  final Map<String, dynamic> rumus;

  const DetailMasalah({super.key, required this.rumus});

  @override
  _DetailMasalahState createState() => _DetailMasalahState();
}

class _DetailMasalahState extends State<DetailMasalah> {
  final Map<String, TextEditingController> controllers = {};
  List<String> variables = [];
  double hasil = 0;

  @override
  void initState() {
    super.initState();
    extractVariables();
  }

  void extractVariables() {
    final regex = RegExp(r'var:(\w+)');
    variables = regex
        .allMatches(widget.rumus['rumus'])
        .map((match) => match.group(1)!)
        .toList();
    
    for (var variable in variables) {
      controllers[variable] = TextEditingController();
    }
  }

  void calculateResult() {
    String expression = widget.rumus['rumus'];
    Map<String, double> values = {};

    for (var variable in variables) {
      values[variable] = double.tryParse(controllers[variable]!.text) ?? 0;
      expression = expression.replaceAll('var:$variable', values[variable].toString());
    }

    try {
      hasil = eval(expression);
      setState(() {});
    } catch (e) {
      hasil = double.nan;
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.rumus['nama'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (var variable in variables)
              TextField(
                controller: controllers[variable],
                decoration: InputDecoration(labelText: variable),
                keyboardType: TextInputType.number,
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateResult,
              child: const Text("Hitung"),
            ),
            const SizedBox(height: 20),
            Text("Hasil: $hasil", style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
