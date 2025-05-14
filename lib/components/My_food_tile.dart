import 'package:flutter/material.dart';
import 'package:fooddelivery2/models/Food.dart';

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
                // text foood details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text(
                        '\₹' + food.price.toString(),
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
                    ],
                  ),
                ), // foood images

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
