import 'package:flutter/material.dart';
import 'package:ucp1/presentation/data_detail_pelanggan.dart';

class DataPelangganPage extends StatefulWidget {
  const DataPelangganPage({super.key});

  @override
  State<DataPelangganPage> createState() => _DataPelangganPageState();
}

class _DataPelangganPageState extends State<DataPelangganPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController hpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController posController = TextEditingController();

  void _resetForm() {
    _formKey.currentState!.reset();
    namaController.clear();
    emailController.clear();
    hpController.clear();
    alamatController.clear();
    provinsiController.clear();
    posController.clear();
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      isDense: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5F2),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text(
          'Data Pelanggan',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Nama Cust",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                TextFormField(
                  controller: namaController,
                  decoration: _inputDecoration("Nama Cust"),
                  validator:
                      (value) =>
                          value!.isEmpty ? 'Cust tidak boleh kosong' : null,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Email"),
                          const SizedBox(height: 4),
                          TextFormField(
                            controller: emailController,
                            decoration: _inputDecoration("Email"),
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? 'Email tidak boleh kosong'
                                        : null,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("No Hp"),
                          const SizedBox(height: 4),
                          TextFormField(
                            controller: hpController,
                            decoration: _inputDecoration("No Hp"),
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? 'No Hp tidak boleh kosong'
                                        : null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text("Alamat"),
                const SizedBox(height: 4),
                TextFormField(
                  controller: alamatController,
                  decoration: _inputDecoration("Alamat"),
                  validator:
                      (value) =>
                          value!.isEmpty ? 'Alamat tidak boleh kosong' : null,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Provinsi"),
                          const SizedBox(height: 4),
                          TextFormField(
                            controller: provinsiController,
                            decoration: _inputDecoration("Provinsi"),
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? 'Provinsi tidak boleh kosong'
                                        : null,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Kode Pos"),
                          const SizedBox(height: 4),
                          TextFormField(
                            controller: posController,
                            decoration: _inputDecoration("Kode Pos"),
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? 'Kode Pos tidak boleh kosong'
                                        : null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Data berhasil disimpan"),
                          ),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>  DataDetailPelanggan(
                                  nama: namaController.text,
                                  email: emailController.text,
                                  hp: hpController.text,
                                  alamat: alamatController.text,
                                  provinsi: provinsiController.text,
                                  kodePos: posController.text,
                                ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: _resetForm,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.redAccent,
                      side: const BorderSide(color: Colors.redAccent),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text("Reset"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
