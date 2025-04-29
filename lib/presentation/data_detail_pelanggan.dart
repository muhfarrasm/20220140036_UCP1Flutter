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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        title: Text('Detail $nama'),
       centerTitle: true,
       titleSpacing: 0,
      ),
       body: Padding(
        padding: const EdgeInsets.all(20), // Padding untuk jarak konten dengan tepi layar
        child: SingleChildScrollView( // Agar konten bisa di-scroll jika melebihi layar
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/cowo.png'),
                ),
                const SizedBox(height: 16),
                Text(
                  nama,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 2),
                Text(
                  hp,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                
              ],
            ),
          ),
        ),

       ),
    );
  }
}