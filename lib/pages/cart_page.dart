import 'package:fooddelivery2/pages/billing_page.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery2/components/my_cart_tile.dart';
// ignore: unused_import
import 'package:fooddelivery2/models/cart_item.dart';
import 'package:fooddelivery2/models/restaurant.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        // cart
        final userCart = restaurant.cart;
        // scaffold ui
        return Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: userCart.length,
                  itemBuilder: (context, index) {
                    final item = userCart[index];
                    return MyCartTile(cartItem: item);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BillingPage()),
                      );
                    },
                    child: const Text('Proceed to Checkout'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
