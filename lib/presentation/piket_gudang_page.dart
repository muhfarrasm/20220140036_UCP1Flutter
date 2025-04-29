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
  

void addTask() {
    if (taskController.text.isEmpty || selectedDate == null) {
      setState(() {
        dateError = selectedDate == null ? "Please select a date" : null;
      });
      return;
    }
    setState(() {
      daftarTask.add(taskController.text);
      tanggalList.add(selectedDate!);
      selectedDate = null;
      taskController.clear();
      dateError = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Task successfully added!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
    );
  }
}