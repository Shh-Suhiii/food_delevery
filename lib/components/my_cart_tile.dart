
import 'package:flutter/material.dart';
import 'package:fooddelivery2/models/cart_item.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(cartItem.food.name),
      subtitle: Text('Quantity: ${cartItem.quantity}'),
      trailing: Text('\$${cartItem.totalPrice.toStringAsFixed(2)}'),
    );
  }
}