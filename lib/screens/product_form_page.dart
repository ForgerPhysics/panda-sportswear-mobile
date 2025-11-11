import 'package:flutter/material.dart';
import 'package:panda_sportswear/widgets/drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  // key global utk identifikasi dan validasi
  final _formKey = GlobalKey<FormState>();

  // Controlleruntuk input teks
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _thumbnailController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();

  // Daftar pilihan untuk Kategori, sesuai models.py projek panda_sportwear
  final List<String> _categoryChoices = [
    'Jersey & Apparel',
    'Sepatu Bola',
    'Peralatan & Perlengkapan',
    'Aksesoris & Merchandise',
  ];
  String? _selectedCategory; // Variabel untuk menyimpan kategori yang dipilih

  // Variabel simpan state switch
  bool _isFeatured = false;

  @override
  void dispose() {
    // dispose controller setelah widget tidak digunakan
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _thumbnailController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create New Product')),

      drawer: const LeftDrawer(),

      body: Form(
        key: _formKey, // Pasang _formKey ke widget Form
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Input Name
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Product Name',
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  counterText: "",
                ),
                maxLength: 60,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Name Produk Tidak Boleh Kosong!";
                  }
                  return null; // Valid
                },
              ),
              const SizedBox(height: 16.0),

              //Input Price
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  hintText: 'Product Price',
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number, // Keyboard khusus angka
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Harga tidak boleh kosong";
                  }

                  if (int.tryParse(value) == null) {
                    return "Harga harus berupa angka";
                  }

                  if (int.parse(value) < 0) {
                    return "Harga tidak boleh negatif";
                  }
                  return null; // Valid
                },
              ),
              const SizedBox(height: 16.0),

              //Input Description
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Product Description',
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3, // Teks area
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Deskripsi tidak boleh kosong";
                  }

                  if (value.length < 10) {
                    return "Deskripsi minimal 10 karakter";
                  }
                  return null; // Valid
                },
              ),
              const SizedBox(height: 16.0),

              //Input thumbnail URL
              TextFormField(
                controller: _thumbnailController,
                decoration: const InputDecoration(
                  hintText: 'URL (e.g., https://.../image.png)',
                  labelText: 'Thumbnail URL (Optional)',
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  // <-- VALIDASI: Sesuai models.py (blank=True, null=True)
                  if (value == null || value.isEmpty) {
                    return null; // Boleh kosong
                  }

                  // Jika diisi, harus URL valid
                  final uri = Uri.tryParse(value);
                  if (uri == null ||
                      !uri.isAbsolute ||
                      (!uri.scheme.startsWith('http'))) {
                    return "Harus berupa URL yang valid (diawali http:// atau https://)";
                  }
                  return null; // kondisi Valid
                },
              ),
              const SizedBox(height: 16.0),

              //Input Category,pake dropdown
              DropdownButtonFormField<String>(
                initialValue: _selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                hint: const Text('Pilih kategori'),
                items: _categoryChoices.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
                validator: (String? value) {
                  if (value == null) {
                    return "Category cannot be empty!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              //Input Stock
              TextFormField(
                controller: _stockController,
                decoration: const InputDecoration(
                  hintText: 'Product Stock',
                  labelText: 'Stock',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Stock tidak boleh kosong";
                  }
                  if (int.tryParse(value) == null) {
                    return "Stock harus berupa angka";
                  }
                  if (int.parse(value) < 0) {
                    return "Stock tidak boleh negatif";
                  }
                  return null; // udh Valid
                },
              ),
              const SizedBox(height: 16.0),

              //Input isFeatured (Switch)
              SwitchListTile(
                title: const Text('Is Featured Product?'),
                value: _isFeatured,
                onChanged: (bool value) {
                  setState(() {
                    _isFeatured = value;
                  });
                },
              ),
              const SizedBox(height: 24.0),

              //tombol Save
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    // Validasi form
                    if (_formKey.currentState!.validate()) {
                      // Ambil semua data dari controller dan state
                      final String name = _nameController.text;
                      final String price = _priceController.text;
                      final String description = _descriptionController.text;
                      final String thumbnail = _thumbnailController.text;
                      final String category = _selectedCategory!;
                      final String stock = _stockController.text;
                      final bool isFeatured = _isFeatured;

                      // Tampilkan pop-up (AlertDialog)
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Product Successfully Saved"),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  const Text(
                                    "Berikut adalah data produk yang Anda masukkan:",
                                  ),
                                  const SizedBox(height: 10),
                                  Text("Name: $name"),
                                  Text("Price: $price"),
                                  Text("Description: $description"),
                                  Text(
                                    "Thumbnail URL: ${thumbnail.isEmpty ? '(Tidak ada)' : thumbnail}",
                                  ),
                                  Text("Category: $category"),
                                  Text("Stock: $stock"),
                                  Text("Is Featured: ${isFeatured.toString()}"),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  // close dialog pop-up
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );

                      // Setelah save (dan pop-up ditampilkan), kosongkan form
                      _formKey.currentState!.reset();
                      _nameController.clear();
                      _priceController.clear();
                      _descriptionController.clear();
                      _thumbnailController.clear();
                      _stockController.clear();
                      setState(() {
                        _isFeatured = false;
                        _selectedCategory = null;
                      });
                    }
                  },
                  child: const Text('Save', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
