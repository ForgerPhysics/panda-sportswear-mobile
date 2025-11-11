import 'package:flutter/material.dart';
import 'package:panda_sportswear/screens/menu.dart';
import 'package:panda_sportswear/screens/product_form_page.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header untuk Drawer
          DrawerHeader(
            decoration: BoxDecoration(
              // pake warna dari tema
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Text(
              'Panda Sportswear',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //Halaman Utama
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),

          //Tambah Produk
          ListTile(
            leading: const Icon(Icons.add_box),
            title: const Text('Tambah Produk'),
            onTap: () {
              // Navigasi ke Halamanform Tambah Produk
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductFormPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
