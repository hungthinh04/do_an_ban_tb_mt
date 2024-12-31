import 'package:flutter/material.dart';
import '../api/api_service.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _processorController = TextEditingController();
  final TextEditingController _ramController = TextEditingController();
  final TextEditingController _storageController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryIdController = TextEditingController();

  final ApiService _apiService = ApiService();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final newProduct = {
        'ProductName': _nameController.text,
        'Brand': _brandController.text,
        'Processor': _processorController.text,
        'RAM': _ramController.text,
        'Storage': _storageController.text,
        'Price': double.parse(_priceController.text),
        'QuantityInStock': int.parse(_quantityController.text),
        'Description': _descriptionController.text,
        'CategoryID': int.parse(_categoryIdController.text),
      };

      final response = await _apiService.addProduct(newProduct);

      if (response) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sản phẩm đã được thêm thành công!')),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Lỗi khi thêm sản phẩm!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thêm sản phẩm')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Tên sản phẩm'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tên sản phẩm';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _brandController,
                  decoration: const InputDecoration(labelText: 'Thương hiệu'),
                ),
                TextFormField(
                  controller: _processorController,
                  decoration: const InputDecoration(labelText: 'Processor'),
                ),
                TextFormField(
                  controller: _ramController,
                  decoration: const InputDecoration(labelText: 'RAM'),
                ),
                TextFormField(
                  controller: _storageController,
                  decoration: const InputDecoration(labelText: 'Storage'),
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(labelText: 'Giá'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập giá';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _quantityController,
                  decoration: const InputDecoration(labelText: 'Số lượng'),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Mô tả'),
                  maxLines: 3,
                ),
                TextFormField(
                  controller: _categoryIdController,
                  decoration: const InputDecoration(labelText: 'Category ID'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Thêm sản phẩm'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
