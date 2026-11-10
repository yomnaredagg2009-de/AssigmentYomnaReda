import 'package:assigment_yomna_s3/carddata.dart';
import 'package:flutter/material.dart';

import 'product_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get total {
    double result = 0;

    for (Product product in cartList) {
      result += product.totalPrice;
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),

      body: Column(
        children: [
          Expanded(
            child: cartList.isEmpty
                ? const Center(
                    child: Text(
                      'Cart is empty',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : ListView.builder(
                    itemCount: cartList.length,

                    itemBuilder: (context, index) {
                      Product product = cartList[index];

                      return Card(
                        margin: const EdgeInsets.all(10),

                        child: ListTile(
                          leading: Text(
                            product.icon,
                            style: const TextStyle(fontSize: 35),
                          ),

                          title: Text(
                            product.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),

                          subtitle: Text(
                            '${product.price} × ${product.quantity} = ${product.totalPrice} EGP',
                          ),

                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,

                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (product.quantity > 1) {
                                      product.quantity--;
                                    } else {
                                      cartList.remove(product);

                                      product.quantity = 0;
                                    }
                                  });
                                },

                                icon: const Icon(Icons.remove),
                              ),

                              Text(
                                '${product.quantity}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    product.quantity++;
                                  });
                                },

                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),

          Container(
            width: double.infinity,

            padding: const EdgeInsets.all(20),

            child: Text(
              'Total: $total EGP',

              textAlign: TextAlign.center,

              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
