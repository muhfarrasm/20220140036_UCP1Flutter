import 'package:flutter/material.dart';
import 'package:ucp1/presentation/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _menuCard(IconData icon, String text, BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.deepOrange,
        elevation: 2,
        margin: const EdgeInsets.all(8),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Icon(icon, size: 30, color: Colors.white),
                const SizedBox(height: 8),
                Text(text, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.deepOrange,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      'assets/images/foto profil.jpg',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Selamat Datang',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.logout, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/BK.jpg',
                  width: size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  Row(
                  children: [
                  _menuCard(Icons.calendar_today , "Data Piket", context),
                  _menuCard(Icons.group, "Data Pelanggan", context),
                ],
                ),
                Row(
                  children: [
                  _menuCard(Icons.inventory, "Barang Masuk", context),
                ],
                )
                ]
                
              )
              
            ),
          ],
        ),
      ),
    );
  }
}
