import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bouquet_provider.dart';
import 'bouquet.dart';

class BouquetDetailScreen extends StatelessWidget {
  final Bouquet bouquet;

  const BouquetDetailScreen({super.key, required this.bouquet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(bouquet.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(bouquet.image, width: double.infinity, height: 250),
          const SizedBox(height: 16),
          Text(bouquet.name,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text("\$${bouquet.price}",
              style: const TextStyle(fontSize: 20, color: Colors.green)),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(bouquet.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16)),
          ),
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {
                      cartProvider.increaseLoves(bouquet);
                    },
                  ),
                  Text("${bouquet.loves}"),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.thumb_up, color: Colors.blue),
                    onPressed: () {
                      cartProvider.increaseLikes(bouquet);
                    },
                  ),
                  Text("${bouquet.likes}"),
                ],
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false)
                  .addToCart(bouquet);
              Navigator.pop(context);
            },
            child: const Text("Add to Bag"),
          ),
        ],
      ),
    );
  }
}
