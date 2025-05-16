import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fooddelivery2/models/restaurant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BillingPage extends StatefulWidget {
  const BillingPage({super.key});

  @override
  State<BillingPage> createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  final TextEditingController _addressController = TextEditingController();
  String _selectedPaymentMethod = 'Cash on Delivery';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Billing Details'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Billing Summary',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Consumer<Restaurant>(
              builder: (context, restaurant, child) {
                final cartItems = restaurant.cart;

                return Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        title: Text(item.food.name),
                        subtitle: Text('Quantity: ${item.quantity}'),
                        trailing: Text('₹${item.totalPrice.toStringAsFixed(2)}'),
                      );
                    },
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            Consumer<Restaurant>(
              builder: (context, restaurant, child) {
                final total = restaurant.cart.fold<double>(
                  0,
                  (sum, item) => sum + item.totalPrice,
                );
                return Text(
                  'Total: ₹${total.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                );
              },
            ),

            const SizedBox(height: 20),
            Text(
              'Delivery Address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                hintText: 'Enter your address',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            DropdownButtonFormField<String>(
              value: _selectedPaymentMethod,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
              items: ['Cash on Delivery', 'Credit Card', 'UPI'].map((method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedPaymentMethod = value;
                  });
                }
              },
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final restaurant = Provider.of<Restaurant>(context, listen: false);
                  final cartItems = restaurant.cart;

                  final orderData = {
                    'timestamp': Timestamp.now(),
                    'items': cartItems.map((item) => {
                      'food': item.food.name,
                      'quantity': item.quantity,
                      'price': item.totalPrice,
                    }).toList(),
                    'total': cartItems.fold(0.0, (sum, item) => sum + item.totalPrice),
                    'address': _addressController.text,
                    'paymentMethod': _selectedPaymentMethod,
                  };

                  await FirebaseFirestore.instance.collection('orders').add(orderData);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Order Confirmed & Saved!')),
                  );
                },
                child: const Text('Confirm Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
