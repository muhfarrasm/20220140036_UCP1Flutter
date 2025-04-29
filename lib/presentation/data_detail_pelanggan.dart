import 'package:flutter/material.dart';

class DataDetailPelanggan extends StatelessWidget {
  final String nama;
  final String email;
  final String hp;
  final String alamat;
  final String provinsi;
  final String kodePos;

  const DataDetailPelanggan({super.key,
  
   required this.nama,
    required this.email,
    required this.hp,
    required this.alamat,
    required this.provinsi,
    required this.kodePos,
  
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}