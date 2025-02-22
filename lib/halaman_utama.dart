import 'package:flutter/material.dart';
import 'package:math_solver/detail_masalah.dart';
import 'package:math_solver/model/rumus.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Math Solver',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 63, 63, 63),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
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
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 243, 238),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    if (constraints.maxWidth <= 700) {
                      return const DaftarRumus();
                    } else if (constraints.maxWidth <= 900) {
                      return const GridDaftarRumus(
                        gridCount: 3,
                      );
                    } else if (constraints.maxWidth <= 1300) {
                      return const GridDaftarRumus(
                        gridCount: 4,
                      );
                    } else {
                      return const GridDaftarRumus(
                        gridCount: 6,
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GridDaftarRumus extends StatelessWidget {
  final int gridCount;
  const GridDaftarRumus({super.key, required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: daftarRumus.map((rumus) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailMasalah(rumus: rumus);
              }));
            },
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(34),
              ),
              color: const Color.fromARGB(255, 188, 184, 177),
              elevation: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(rumus.gambar),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      rumus.nama,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 70, 63, 58),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0),
                    child: Text(
                      rumus.deskripsi,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DaftarRumus extends StatelessWidget {
  const DaftarRumus({super.key});
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
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      
                      image: DecorationImage(
                        image: AssetImage(rumus.gambar),
                      ),
                    ),
                  ),
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
                        const SizedBox(
                          height: 10,
                        ),
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
