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

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _tanggalController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }

    void _updateHarga() {
    int jumlah = int.tryParse(_jumlahController.text) ?? 0;
    int hargaPerUnit = 50000;
    int total = jumlah * hargaPerUnit;
    _hargaController.text = total.toString();
  }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}