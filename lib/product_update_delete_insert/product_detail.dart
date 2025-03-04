import 'package:flutter/material.dart';
class ProductDetailScreen extends StatelessWidget {
  final String product;
  final double price;

  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    product,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(thickness: 5, height: 20),
                Text(
                  'Price: \$${price.toString()}',
                  style: const TextStyle(fontSize: 18, color: Colors.teal),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Description:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                const Text(
                  'This is a high-quality product with excellent durability and performance.',
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Order Success'),
                            content: Text(
                                'You have successfully purchased $product.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close dialog
                                  Navigator.pop(
                                    context,
                                    'Thanks! Choose next products.',
                                  );
                                },
                                child: const Text(
                                  'OK',
                                  style: TextStyle(color: Colors.teal),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text('Confirm'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Cancel Order'),
                            content: const Text(
                                'You have cancelled the order.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close dialog
                                  Navigator.pop(
                                    context,
                                    'Thank you for your interest in our products.',
                                  );
                                },
                                child: const Text(
                                  'OK',
                                  style: TextStyle(color: Colors.teal),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
