import 'package:flutter/material.dart';

abstract class Rumus {
  final String nama;
  final String deskripsi;
  final gambar;
  double hasil = 0.0;
  final Widget Function(Function(Map<String, double>)) inputBuilder;

  Rumus(this.nama, this.deskripsi, this.inputBuilder, this.gambar);

  double hitung(Map<String, double> params);
}

class Segitiga extends Rumus {
  Segitiga()
      : super(
          "Luas Segitiga",
          "Rumus menghitung luas segitiga. Masukkan alas dan tinggi.",
          (onInputChanged) => Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Alas',
                ),
                onChanged: (value) {
                  onInputChanged({'alas': double.tryParse(value) ?? 0.0});
                },
              ),
              const SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tinggi',
                ),
                onChanged: (value) {
                  onInputChanged({'tinggi': double.tryParse(value) ?? 0.0});
                },
              ),
            ],
          ),
          'images/triangle.png',
        );

  @override
  double hitung(Map<String, double> params) {
    double alas = params['alas'] ?? 0.0;
    double tinggi = params['tinggi'] ?? 0.0;
    hasil = double.parse((0.5 * alas * tinggi).toStringAsFixed(2));
    return hasil;
  }
}

class Persegi extends Rumus {
  Persegi()
      : super(
          "Luas Persegi",
          "Rumus menghitung luas persegi. Masukkan panjang sisi.",
          (onInputChanged) => TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Sisi',
            ),
            onChanged: (value) {
              onInputChanged({'sisi': double.tryParse(value) ?? 0.0});
            },
          ),
          'images/rectangle.png',
        );

  @override
  double hitung(Map<String, double> params) {
    double sisi = params['sisi'] ?? 0.0;
    hasil = double.parse((sisi * sisi).toStringAsFixed(2));
    return hasil;
  }
}

class Lingkaran extends Rumus {
  Lingkaran()
      : super(
          "Luas Lingkaran",
          "Rumus menghitung luas lingkaran. Masukkan panjang jari-jari.",
          (onInputChanged) => TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Jari-jari',
            ),
            onChanged: (value) {
              onInputChanged({'jariJari': double.tryParse(value) ?? 0.0});
            },
          ),
          'images/circle.png',
        );

  @override
  double hitung(Map<String, double> params) {
    double jariJari = params['jariJari'] ?? 0.0;
    hasil = double.parse((3.14 * jariJari * jariJari).toStringAsFixed(2));
    return hasil;
  }
}

class KelilingSegitiga extends Rumus {
  KelilingSegitiga()
      : super(
          "Keliling Segitiga",
          "Rumus menghitung keliling segitiga. Masukkan panjang ketiga sisi.",
          (onInputChanged) => Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Sisi 1',
                ),
                onChanged: (value) {
                  onInputChanged({'sisi1': double.tryParse(value) ?? 0.0});
                },
              ),
              const SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Sisi 2',
                ),
                onChanged: (value) {
                  onInputChanged({'sisi2': double.tryParse(value) ?? 0.0});
                },
              ),
              const SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Sisi 3',
                ),
                onChanged: (value) {
                  onInputChanged({'sisi3': double.tryParse(value) ?? 0.0});
                },
              ),
            ],
          ),
          'images/triangle.png',
        );

  @override
  double hitung(Map<String, double> params) {
    double sisi1 = params['sisi1'] ?? 0.0;
    double sisi2 = params['sisi2'] ?? 0.0;
    double sisi3 = params['sisi3'] ?? 0.0;
    hasil = double.parse((sisi1 + sisi2 + sisi3).toStringAsFixed(2));
    return hasil;
  }
}

class KelilingPersegi extends Rumus {
  KelilingPersegi()
      : super(
          "Keliling Persegi",
          "Rumus menghitung keliling persegi. Masukkan panjang sisi.",
          (onInputChanged) => TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Sisi',
            ),
            onChanged: (value) {
              onInputChanged({'sisi': double.tryParse(value) ?? 0.0});
            },
          ),
          'images/rectangle.png',
        );

  @override
  double hitung(Map<String, double> params) {
    double sisi = params['sisi'] ?? 0.0;
    hasil = double.parse((4 * sisi).toStringAsFixed(2));
    return hasil;
  }
}

class KelilingLingkaran extends Rumus {
  KelilingLingkaran()
      : super(
          "Keliling Lingkaran",
          "Rumus menghitung keliling lingkaran. Masukkan panjang jari-jari.",
          (onInputChanged) => TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Jari-jari',
            ),
            onChanged: (value) {
              onInputChanged({'jariJari': double.tryParse(value) ?? 0.0});
            },
          ),
          'images/circle.png',
        );

  @override
  double hitung(Map<String, double> params) {
    double jariJari = params['jariJari'] ?? 0.0;
    hasil = double.parse((2 * 3.14 * jariJari).toStringAsFixed(2));
    return hasil;
  }
}

var daftarRumus = [
  Segitiga(),
  Persegi(),
  Lingkaran(),
  KelilingSegitiga(),
  KelilingPersegi(),
  KelilingLingkaran(),
];
