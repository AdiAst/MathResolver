import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:math_solver/detail_masalah.dart';
import 'package:math_solver/model/rumus.dart';
import 'package:path_provider/path_provider.dart';



class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  List<Rumus> daftarRumus = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String content = await readJsonFromFile();
    Map<String, dynamic> jsonData = jsonDecode(content);
    List<dynamic> bangunDatarList = jsonData['daftarMasalah'];
    print( bangunDatarList);
    setState(() {
      daftarRumus = bangunDatarList.map((data) => Rumus.fromJson(data)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 175, 160),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(46),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Math Solver',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 63, 63, 63),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Aplikasi yang dirancang khusus untuk membantu Anda menyelesaikan berbagai jenis soal matematika, dari yang paling sederhana hingga yang paling kompleks.',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 63, 63, 63),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: DaftarRumus(daftarRumus: daftarRumus),
            )
          ],
        ),
      ),
    );
  }
}

class DaftarRumus extends StatelessWidget {
  final List<Rumus> daftarRumus;
  const DaftarRumus({super.key, required this.daftarRumus});
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(46),
      itemCount: daftarRumus.length,
      itemBuilder: (context, index) {
        final Rumus rumus = daftarRumus[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailMasalah(rumus: rumus);
                },
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(34),
            ),
            color: const Color.fromARGB(255, 188, 184, 177),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          rumus.nama,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 70, 63, 58),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          rumus.deskripsi,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Future<String> readJsonFromFile() async {
  Directory? directory = await getExternalStorageDirectory();
  if (directory != null) {
    String filePath = '${directory.path}/data.json';
    File file = File(filePath);
    if (await file.exists()) {
      return await file.readAsString();
    } else {
      return '{}';
    }
  } else {
    return '{}';
  }
}
