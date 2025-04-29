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
        title: Text('Detail $tugas',
        style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(
    color: Colors.white, // <- ini yang mengatur warna ikon back
  ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatTanggalDenganHari(tanggal),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    nama,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Card(
              color: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    tugas,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
