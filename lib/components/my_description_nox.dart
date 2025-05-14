import 'package:flutter/material.dart';

class MyDescriptionNox extends StatelessWidget {
  const MyDescriptionNox({super.key});

  @override
  Widget build(BuildContext context) {
    //textstyle
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
    );
    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8),
      ),

      child: Padding(
        padding: const EdgeInsets.all(25.0),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // delivery fee
            Column(
              children: [
                Text('149', style: myPrimaryTextStyle),
                Text('Delivery fee'),
              ],
            ),

            // delivery time
            Column(
              children: [
                Text('15-20 min', style: myPrimaryTextStyle),
                Text('Delivery time', style: mySecondaryTextStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
