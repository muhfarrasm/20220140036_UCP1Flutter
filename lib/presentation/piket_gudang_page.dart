import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp1/presentation/home_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ucp1/presentation/detail_piket_page.dart';

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
  bool isDateFormatReady = false;

  @override
  void initState() {
    super.initState();
    _initLocaleData();
  }

  Future<void> _initLocaleData() async {
    await initializeDateFormatting('id_ID', null);
    setState(() {
      isDateFormatReady = true;
    });
  }

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
    if (!key.currentState!.validate() || selectedDate == null) {
      setState(() {
        dateError = selectedDate == null ? "Please select a date" : null;
      });
      return;
    }
    setState(() {
      daftarTask.add(taskController.text);
      daftarNama.add(namaController.text);
      tanggalList.add(selectedDate!);
      selectedDate = null;
      taskController.clear();
      namaController.clear();
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
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),

        title: const Text(
          'Piket Gudang',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Nama Anggota",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: namaController,
                    decoration: InputDecoration(
                      hintText: 'Nama Anggota',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),
                  const Text("Pilih Tanggal"),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: _selectDate,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        hintText: 'Pilih Tanggal',
                        prefixIcon: const Icon(Icons.calendar_today),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        selectedDate != null
                            ? formatTanggalDenganHari(selectedDate!)
                            : 'Pilih Tanggal',
                        style: TextStyle(
                          color:
                              selectedDate == null ? Colors.grey : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  if (dateError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        dateError!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),

                  const SizedBox(height: 16),
                  const Text("Tugas Piket"),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: taskController,
                          decoration: InputDecoration(
                            hintText: 'Tugas Piket',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Tugas tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: addTask,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                          ),

                          child: const Text('Tambah'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Center(
                    child: Text(
                      'Daftar Tugas Piket',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  daftarTask.isEmpty
                      ? const Center(child: Text("Belum ada Data"))
                      : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: daftarTask.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.deepOrange,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              leading: const Icon(
                                Icons.task,
                                color: Colors.white,
                              ),
                              title: Text(
                                daftarTask[index],
                                style: const TextStyle(color: Colors.white),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => DetailPiketPage(
                                          tugas: daftarTask[index],
                                          nama: daftarNama[index],
                                          tanggal: tanggalList[index],
                                        ),
                                  ),
                                );
                              },
                              // subtitle: Text(
                              //   '${daftarNama[index]} - ${formatTanggalDenganHari(tanggalList[index])}',
                              // ),
                            ),
                          );
                        },
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
