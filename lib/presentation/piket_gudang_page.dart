import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PiketGudangPage extends StatefulWidget {
  const PiketGudangPage({super.key});

  @override
  State<PiketGudangPage> createState() => _PiketGudangPageState();
}

class _PiketGudangPageState extends State<PiketGudangPage> {

  final TextEditingController taskController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final key = GlobalKey<FormState>();

   List<String> daftarTask = [];
   List<String> daftarNama = [];
   List<DateTime> tanggalList = [];
   String? dateError;
  DateTime? selectedDate;

   Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    );
    

     if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        dateError = null; // Hapus error jika sudah pilih tanggal
      });
    }
  }
  String formatTanggalDenganHari(DateTime date) {
    final formatter = DateFormat('EEEE, dd-MM-yyyy', 'id_ID');
    return formatter.format(date);
  }
  


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
    );
  }
}