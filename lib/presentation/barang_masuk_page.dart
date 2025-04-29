import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


void main() {
  runApp(MaterialApp(home: BarangMasukPage()));
}

class BarangMasukPage extends StatefulWidget {
  const BarangMasukPage({super.key});

  @override
  State<BarangMasukPage> createState() => _BarangMasukPageState();
}

class _BarangMasukPageState extends State<BarangMasukPage> {
  TextEditingController _tanggalController = TextEditingController();
  TextEditingController _jumlahController = TextEditingController();
  TextEditingController _hargaController = TextEditingController();

  String? _selectedJenisTransaksi;
  String? _selectedJenisBarang;

  List<String> jenisTransaksiList = ['Masuk', 'Keluar'];
  List<String> jenisBarangList = ['Plastik', 'Kertas', 'Logam'];

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}