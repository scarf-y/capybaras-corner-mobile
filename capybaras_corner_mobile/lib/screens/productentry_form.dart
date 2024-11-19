import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import 'menu.dart';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  int _chillLevel = 0;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: TextFormField(
                  maxLength: 255,
                  decoration: InputDecoration(
                    hintText: "Capybara X",
                    labelText: "Nama",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0)
                    )
                  ),
                  onChanged: (String? value){
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value){
                    if(value == null || value.isEmpty){
                      return "Nama Capybara tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(9.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Harga",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0)
                      )
                  ),
                  onChanged: (String? value){
                    setState(() {
                      _price = int.tryParse(value ?? '0') ?? 0;
                    });
                  },
                  validator: (String? value){
                    if(value == null){
                      return "Harga capybara tidak boleh kosong";
                    }
                    final harga = int.tryParse(value);
                    if(harga == null){
                      return "Harga Capybara harus berupa angka!";
                    }
                    if(harga < 0){
                      return "Harga tidak boleh bilangan negatif";
                    }
                    return null;
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(9.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "...",
                      labelText: "Deskripsi",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0)
                      )
                  ),
                  onChanged: (String? value){
                    setState(() {
                      _description = value ?? "";
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(9.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Chill Level",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0)
                      )
                  ),
                  onChanged: (String? value){
                    setState(() {
                      _chillLevel = int.tryParse(value ?? '0') ?? 0;
                    });
                  },
                  validator: (String? value){
                    if(value == null || value.isEmpty){
                      return "Chill Level tidak boleh kosong!";
                    }

                    final harga = int.tryParse(value);
                    if(harga == null){
                      return "Chill Level harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Kirim ke Django dan tunggu respons
                        final response = await request.postJson(
                          "http://localhost:8000/create-flutter/",
                          jsonEncode(<String, String>{
                            'name': _name,
                            'price': _price.toString(),
                            'description': _description,
                            'chill_level': _chillLevel.toString()
                          }),
                        );
                        if (context.mounted) {
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Capybara baru berhasil disimpan!"),
                            ));
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MyHomePage()),
                            );
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content:
                              Text("Terdapat kesalahan, silakan coba lagi."),
                            ));
                          }
                        }
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}