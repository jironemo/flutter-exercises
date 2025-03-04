import 'package:flutter/material.dart';
import 'product.dart';
import 'product_db.dart';

class ProductUpdateScreen extends StatefulWidget {
  const ProductUpdateScreen({super.key});

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  Product? _selectedProduct;
  String _message = "";

  void _searchProduct() async {
    String name = _searchController.text.trim();
    if (name.isEmpty) {
      setState(() {
        _message = "Please enter a product name!";
        _selectedProduct = null;
      });
      return;
    }
    Product? products = await DatabaseHelper.instance.searchProductByName(name);
    if (products != null) {
      setState(() {
        _selectedProduct = products;
        _nameController.text = _selectedProduct!.name;
        _priceController.text = _selectedProduct!.price.toString();
      });
    } else {
      setState(() {
        _selectedProduct = null;
        _message = "Product not found";
      });
    }
  }

  void _updateProduct() async {
    if (_selectedProduct == null) return;

    final updatedProduct = Product(
      id: _selectedProduct!.id,
      name: _nameController.text.trim(),
      price: double.tryParse(_priceController.text.trim()) ??
          _selectedProduct!.price,
    );

    await DatabaseHelper.instance.updateItem(updatedProduct);
    setState(() {
      _message = "Product updated successfully";
    });

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Update Product"), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Product
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Search Product by Name",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchProduct,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Product Update Form (Only visible if a product is found)
            _selectedProduct != null
                ? Column(
                    children: [
                      TextField(
                        controller: _nameController,
                        decoration:
                            const InputDecoration(labelText: "Product Name"),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: "Product Price"),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _updateProduct,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal),
                        child: const Text("Update Product"),
                      ),
                    ],
                  )
                : Text(_message,
                    style: const TextStyle(fontSize: 16, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
