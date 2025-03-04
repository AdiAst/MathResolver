import 'package:flutter/material.dart';

class TambahMasalah extends StatefulWidget {
  @override
  _TambahMasalahState createState() => _TambahMasalahState();
}

class _TambahMasalahState extends State<TambahMasalah> {
  String inputText = "";
  List<String> variables = [];
  TextEditingController varController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();

  void updateInput(String value) {
    setState(() {
      inputText += value;
    });
  }

  void addVariable() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Tambah Variabel"),
          content: TextField(
            controller: varController,
            decoration: InputDecoration(labelText: "Nama Variabel"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  variables.add(varController.text);
                });
                varController.clear();
                Navigator.pop(context);
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  void addFormula() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Tambah Rumus"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Nama"),
              ),
              TextField(
                controller: descController,
                decoration: InputDecoration(labelText: "Deskripsi"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                nameController.clear();
                descController.clear();
                Navigator.pop(context);
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dynamic Input")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Input",
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      inputText = "";
                    });
                  },
                ),
              ),
              controller: TextEditingController(text: inputText),
            ),
          ),
          Wrap(
            children: [
              ...["1", "2", "3", "+", "4", "5", "6", "-", "7", "8", "9", "*", "0", "Var", "/"]
                  .map((e) => Padding(
                        padding: EdgeInsets.all(4.0),
                        child: ElevatedButton(
                          onPressed: e == "Var" ? addVariable : () => updateInput(e),
                          child: Text(e),
                        ),
                      )),
            ],
          ),
          Wrap(
            children: variables.map((varName) {
              return Padding(
                padding: EdgeInsets.all(4.0),
                child: ElevatedButton(
                  onPressed: () => updateInput(varName),
                  child: Text(varName),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: addFormula,
            child: Text("Tambah"),
          ),
        ],
      ),
    );
  }
}
