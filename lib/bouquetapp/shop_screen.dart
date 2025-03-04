import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bouquet_provider.dart';
import 'bouquet.dart';
import 'user_cart.dart';
import 'detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Bouquet> bouquets = [
    Bouquet(
        name: "Rose Bouquet",
        price: 20.0,
        image: "images/flower1.jpg",
        description: "A beautiful bouquet of fresh roses."),
    Bouquet(
        name: "Tulip Bouquet",
        price: 25.0,
        image: "images/flower2.jpg",
        description: "A colorful bouquet of fresh tulips."),
    Bouquet(
        name: "Lily Bouquet",
        price: 30.0,
        image: "images/flower3.jpg",
        description: "A fragrant bouquet of fresh lilies."),
    Bouquet(
        name: "Carnations Bouquet",
        price: 20.0,
        image: "images/flower4.jpg",
        description: "A beautiful bouquet of fresh roses."),
    Bouquet(
        name: "sunflowers Bouquet",
        price: 25.0,
        image: "images/flower6.jfif",
        description: "A colorful bouquet of fresh tulips."),
    Bouquet(
        name: "Love Rose Bouquet",
        price: 30.0,
        image: "images/flower7.jfif",
        description: "A fragrant bouquet of fresh lilies."),
    Bouquet(
        name: "Friend Rose Bouquet",
        price: 20.0,
        image: "images/flower7.jfif",
        description: "A beautiful bouquet of fresh roses."),
    Bouquet(
        name: "Yellow Rose Bouquet",
        price: 25.0,
        image: "images/flower8.jfif",
        description: "A colorful bouquet of fresh tulips."),
    Bouquet(
        name: "Red Rose Bouquet",
        price: 30.0,
        image: "images/flower9.jfif",
        description: "A fragrant bouquet of fresh lilies."),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fresh Flower Bouquet Shop"),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_bag, size: 50),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()),
                    ),
                  ),
                  if (cart.itemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text(
                          '${cart.itemCount}',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: bouquets.length,
        itemBuilder: (context, index) {
          final bouquet = bouquets[index];
          return Card(
            child: ListTile(
              leading: Image.asset(bouquet.image, width: 50, height: 50),
              title: Text(bouquet.name),
              subtitle: Text("\$${bouquet.price}"),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BouquetDetailScreen(bouquet: bouquet),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
