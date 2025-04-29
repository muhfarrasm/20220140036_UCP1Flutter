import 'package:flutter/material.dart';

class DetailPiketPage extends StatelessWidget {
  final String tugas;
  final String nama;
  final DateTime tanggal;

  const DetailPiketPage({
    super.key,
    required this.tugas,
    required this.nama,
    required this.tanggal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tugas Piket'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(child: Text(tugas, style: const TextStyle(fontSize: 24))),
    );
  }
}
