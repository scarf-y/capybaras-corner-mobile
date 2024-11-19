import 'package:capybaras_corner_mobile/screens/list_productentry.dart';
import 'package:flutter/material.dart';
import 'package:capybaras_corner_mobile/screens/menu.dart';
import 'package:capybaras_corner_mobile/screens/productentry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'Capybaras Corner',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Times New Roman"
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Grab your own Capybara now!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_outlined),
            title: const Text('Tambah Produk'),
            // Bagian redirection ke ProductEntryFormPage
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductEntryFormPage()));
            },
          ),

          ListTile(
            leading: const Icon(Icons.list_outlined),
            title: const Text('Daftar Produk'),
            onTap: () {
              // Route menu ke halaman mood
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductEntryPage()),
              );
            },
          ),

        ],
      ),
    );
  }
}