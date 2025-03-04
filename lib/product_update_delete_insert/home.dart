import 'package:demo_app/product_update_delete_insert/product_insert.dart';
import 'package:demo_app/product_update_delete_insert/product_list.dart';
import 'package:demo_app/product_update_delete_insert/product_update.dart';
import 'package:demo_app/product_update_delete_insert/product_delete.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Navigation',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Product List'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Product Insert'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductInsertScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Product Delete'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductDeleteScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Product Update'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductUpdateScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Welcome to the E-Commerce App'),
      ),
    );
  }
}
