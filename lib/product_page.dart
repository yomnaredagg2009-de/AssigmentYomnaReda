import 'package:assigment_yomna_s3/card_page.dart';
import 'package:assigment_yomna_s3/carddata.dart';
import 'package:flutter/material.dart';

import 'product_model.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Product> products = [
    Product(name: 'Burger', icon: '🍔', price: 100),
    Product(name: 'Pizza', icon: '🍕', price: 150),
    Product(name: 'Fries', icon: '🍟', price: 70),
    Product(name: 'Cola', icon: '🥤', price: 50),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(10),

        itemCount: products.length,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),

        itemBuilder: (context, index) {
          Product product = products[index];

          bool isAdded = cartList.contains(product);

          return Card(
            elevation: 3,

            child: Padding(
              padding: const EdgeInsets.all(10),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(product.icon, style: const TextStyle(fontSize: 50)),

                  const SizedBox(height: 10),

                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    '${product.price} EGP',
                    style: const TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 15),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isAdded ? Colors.red : Colors.blue,

                      foregroundColor: Colors.white,
                    ),

                    onPressed: () {
                      setState(() {
                        if (isAdded) {
                          cartList.remove(product);

                          product.quantity = 0;
                        } else {
                          product.quantity = 1;

                          cartList.add(product);
                        }
                      });
                    },

                    child: Text(isAdded ? 'Added' : 'Add to cart'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
