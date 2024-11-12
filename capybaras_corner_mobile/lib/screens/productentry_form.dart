import 'package:flutter/material.dart';

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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Capybara berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Harga: $_price'),
                                    Text('Deskripsi: $_description'),
                                    Text('Chill Level: $_chillLevel'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
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