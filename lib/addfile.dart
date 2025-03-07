import 'dart:convert';
import 'dart:io';
import 'package:dart_eval/dart_eval.dart';
import 'package:path_provider/path_provider.dart';

Future<void> saveJsonToFile() async {
  Map<String, dynamic> data = {
  "daftarMasalah": [
    {
      "id": 1, 
      "nama": "Luas Segitiga",
      "deskripsi": "lorem50",
      "rumus": "var:a * var:b / 2"
    },
    {
      "id": 2, 
      "nama": "Luas Persegi",
      "deskripsi": "lorem50",
      "rumus": "var:a * var:a"
    },
    {
      "id": 3, 
      "nama": "keliling Segitiga",
      "deskripsi": "sss",
      "rumus": "var:a + var:b + var:c"
    }
  ]
};

  String jsonString = jsonEncode(data);

  Directory? directory = await getExternalStorageDirectory();
  
  if (directory != null) {
    String filePath = '${directory.path}/data.json';

    File file = File(filePath);
    await file.writeAsString(jsonString);

    print('File berhasil disimpan di: $filePath');
  } else {
    print('Gagal mendapatkan direktori penyimpanan.');
  }
}
Future<String> readJsonFromFile() async {
  Directory? directory = await getExternalStorageDirectory();
  if (directory != null) {
    String filePath = '${directory.path}/data.json';
    File file = File(filePath);
    if (await file.exists()) {
      return await jsonDecode(await file.readAsString())["daftarMasalah"].cast<Map<String, dynamic>>();
    } else {
      return 'File tidak ditemukan';
    }
  } else {
    return 'Gagal mendapatkan direktori penyimpanan';
  }
}

testEval(String rumus){
  return eval(rumus);
}

