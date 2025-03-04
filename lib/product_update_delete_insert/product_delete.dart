import 'package:flutter/material.dart';
import 'product.dart';
import 'product_db.dart';

class ProductDeleteScreen extends StatefulWidget {
  const ProductDeleteScreen({super.key});

  @override
  _ProductDeleteScreenState createState() => _ProductDeleteScreenState();
}

class _ProductDeleteScreenState extends State<ProductDeleteScreen> {
  final TextEditingController _searchController = TextEditingController();
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
    } //end if

    Product? result = await DatabaseHelper.instance.searchProductByName(name);
    setState(() {
      if (result != null) {
        _selectedProduct = result;
        _message = ""; // Clear message if product is found
      } else {
        _selectedProduct = null;
        _message = "Product not found!";
      }
    });
  } //end method

  void _deleteProduct() async {
    if (_selectedProduct == null) {
      setState(() {
        _message = "No product selected!";
      });
      return;
    }

    int result =
        await DatabaseHelper.instance.deleteItemByName(_selectedProduct!.name);

    setState(() {
      if (result > 0) {
        _message = "Product deleted successfully!";
        _selectedProduct = null;
        _searchController.clear();
      } else {
        _message = "Error deleting product!";
      }
    });
    if (mounted) {
      Navigator.pop(context); // back previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delete Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Enter product name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchProduct,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _selectedProduct != null
                ? Column(
                    children: [
                      Text("Product: ${_selectedProduct!.name}",
                          style: const TextStyle(fontSize: 18)),
                      Text(
                          "Price: \$${_selectedProduct!.price.toStringAsFixed(2)}"),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _deleteProduct,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: const Text("Delete Product",
                            style: TextStyle(color: Colors.white)),
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
