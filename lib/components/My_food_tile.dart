import 'package:flutter/material.dart';
import 'package:fooddelivery2/models/Food.dart';
import 'package:provider/provider.dart';
import 'package:fooddelivery2/models/restaurant.dart';
import 'package:fooddelivery2/pages/cart_page.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const FoodTile({super.key, required this.food, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                // text food details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text(
                        '₹${food.price}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        food.description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      SizedBox(height: 10),

                      // Add to Cart Button
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<Restaurant>(context, listen: false).addtoCart(food, []);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CartPage()),
                          );
                        },
                        child: const Text("Add to Cart"),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(food.imagePath, height: 120),
                ),
              ],
            ),
          ),
        ),
        Divider(
          endIndent: 25,
          indent: 25,
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}