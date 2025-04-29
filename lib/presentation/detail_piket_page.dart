import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  String formatTanggalDenganHari(DateTime date) {
    final formatter = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail $tugas'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formatTanggalDenganHari(tanggal),
              style: const TextStyle(
                fontSize: 18,
                color: Colors.deepOrange,
                fontWeight: FontWeight.w500,
              ),
            ),
          ]
        ),
    );
  }
}
