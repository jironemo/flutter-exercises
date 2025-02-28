import 'package:demo_app/database/database1/ecommence/product_detail.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ECommerceApp());

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String? message;

  final Map<String, int> products = {
    'Laptop': 300,
    'Smartphone': 200,
    'Headphones': 50,
    'Smartwatch': 100,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products.keys.elementAt(index);
                final price = products.values.elementAt(index);

                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.shopping_bag,
                      color: Colors.teal[300],
                    ),
                    title: Text(
                      product,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      '\$${price.toString()}',
                      style: TextStyle(color: Colors.teal[700]),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            product: product,
                            price: price,
                          ),
                        ),
                      );
                      if (result != null) {
                        setState(() {
                          message = result as String;
                        });
                      }
                    },
                  ),
                );
              },
            ),
          ),
          if (message != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                message!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
