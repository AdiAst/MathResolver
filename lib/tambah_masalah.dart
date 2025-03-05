import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class TambahMasalah extends StatefulWidget {
  @override
  _TambahMasalahState createState() => _TambahMasalahState();
}

class _TambahMasalahState extends State<TambahMasalah> {
  String inputText = "";
  List<String> variables = [];
  List<Map<String, dynamic>> daftarMasalah = [];
  TextEditingController varController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();

  void updateInput(String value) {
  setState(() {
    if (inputText.isEmpty) {
      inputText = value;
    } else {
      String lastChar = inputText.split(" ").last;

      if (double.tryParse(lastChar) != null && double.tryParse(value) != null) {
        inputText += value;
      } 
      else if (double.tryParse(lastChar) != null || double.tryParse(value) != null) {
        inputText += " $value";
      } 
      else {
        inputText += " $value";
      }
    }
    inputText = inputText.trim();
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

  Future<void> saveJsonToFile() async {
    Directory? directory = await getExternalStorageDirectory();
      print("inputText sebelum konversi: '$inputText'");
    if (directory != null) {
      String filePath = '${directory.path}/data.json';
      File file = File(filePath);

      List<Map<String, dynamic>> existingData = [];
      if (await file.exists()) {
        String content = await file.readAsString();
        existingData = jsonDecode(content)["daftarMasalah"].cast<Map<String, dynamic>>();
      }


      if (inputText.isNotEmpty) {
        String convertedInput = inputText
            .trim()
            .split(RegExp(r'\s+')) 
            .map((e) => double.tryParse(e) != null ? double.parse(e).toString() : e)
            .join(" ");


        if (convertedInput.isNotEmpty) {
          Map<String, dynamic> newEntry = {
            "id": existingData.length + 1,
            "nama": nameController.text.trim(),
            "deskripsi": descController.text.trim(),
            "rumus": convertedInput,
          };
          daftarMasalah.add(newEntry);
        }
      }

      existingData.addAll(daftarMasalah);
      Map<String, dynamic> data = {"daftarMasalah": existingData};
      String jsonString = jsonEncode(data);
      await file.writeAsString(jsonString);
      print('File berhasil disimpan di: $filePath');
    } else {
      print('Gagal mendapatkan direktori penyimpanan.');
    }
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
            onPressed: () async {
              await saveJsonToFile();
              setState(() {
                inputText = ""; 
                nameController.clear();
                descController.clear();
              });
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
              controller: TextEditingController(text: inputText.trim()),
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
                  onPressed: () => updateInput("var:$varName"),
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