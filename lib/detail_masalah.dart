import 'package:flutter/material.dart';
import 'package:math_solver/model/rumus.dart';

class DetailMasalah extends StatefulWidget {
  final Rumus rumus;

  const DetailMasalah({super.key, required this.rumus});

  @override
  _DetailMasalahState createState() => _DetailMasalahState();
}

class _DetailMasalahState extends State<DetailMasalah> {
  final Map<String, double> _inputValues = {};

  void calculateHasil() {
    // setState(() {
    //   widget.rumus.hitung(_inputValues);
    // });

    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       content: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Text(
    //             '${widget.rumus.hasil}',
    //             style: const TextStyle(
    //               fontSize: 50,
    //               fontWeight: FontWeight.bold,
    //               color: Color.fromARGB(255, 224, 175, 160),
    //             ),
    //             textAlign: TextAlign.center,
    //           ),
    //           const SizedBox(height: 10),
    //           const Text(
    //             'adalah jawaban dari masalah ini ଘ(੭ˊᵕˋ)੭',
    //             style: TextStyle(
    //               fontSize: 14,
    //               fontStyle: FontStyle.italic,
    //               color: Colors.grey,
    //             ),
    //             textAlign: TextAlign.center,
    //           ),
    //           const SizedBox(height: 20),
    //           ElevatedButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             style: ElevatedButton.styleFrom(
    //               backgroundColor: const Color.fromARGB(255, 224, 175, 160),
    //               foregroundColor: Colors.white,
    //               padding: const EdgeInsets.symmetric(
    //                   vertical: 12, horizontal: 24),
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(12),
    //               ),
    //             ),
    //             child: const Text(
    //               'Tutup',
    //               style: TextStyle(fontSize: 16),
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 223, 223),
      resizeToAvoidBottomInset: true, 
      // body: SafeArea(
      //   child: SingleChildScrollView(  
      //     padding: const EdgeInsets.all(20),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: <Widget>[
      //         Stack(
      //           children: <Widget>[
      //             IconButton(
      //               icon: const Icon(Icons.arrow_back),
      //               onPressed: () {
      //                 Navigator.pop(context);
      //               },
      //             ),
      //           ],
      //         ),
      //         const SizedBox(height: 16),
      //         Center(
      //           child: Container(
      //             width: 150,
      //             height: 150,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(16),
      //               image: DecorationImage(
      //                 image: AssetImage(widget.rumus.gambar),
      //                 fit: BoxFit.contain,
      //               ),
      //             ),
      //           ),
      //         ),
      //         const SizedBox(height: 16),
      //         Text(
      //           widget.rumus.nama,
      //           textAlign: TextAlign.center,
      //           style: const TextStyle(
      //             fontSize: 30.0,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //         const SizedBox(height: 20),
      //         widget.rumus.inputBuilder((params) {
      //           setState(() {
      //             _inputValues.addAll(params);
      //           });
      //         }),
      //         const SizedBox(height: 20),
      //         ElevatedButton(
      //           onPressed: calculateHasil,
      //           style: ElevatedButton.styleFrom(
      //             backgroundColor: const Color.fromARGB(255, 224, 175, 160),
      //             foregroundColor: Colors.white,
      //             padding: const EdgeInsets.symmetric(vertical: 22),
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(12),
      //             ),
      //             textStyle: const TextStyle(
      //               fontSize: 18,
      //             ),
      //           ),
      //           child: const Text("Hitung"),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
