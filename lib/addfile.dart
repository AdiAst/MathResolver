import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<void> saveJsonToFile() async {
  // Data yang akan disimpan dalam JSON
  Map<String, dynamic> data = {
    "nama": "Flutter Developer",
    "umur": 25
  };

  // Ubah data menjadi format JSON string
  String jsonString = jsonEncode(data);

  // Dapatkan directory penyimpanan eksternal
  Directory? directory = await getExternalStorageDirectory();
  
  if (directory != null) {
    // Path ke file JSON
    String filePath = '${directory.path}/data.json';

    // Tulis file
    File file = File(filePath);
    await file.writeAsString(jsonString);

    print('File berhasil disimpan di: $filePath');
  } else {
    print('Gagal mendapatkan direktori penyimpanan.');
  }
}
