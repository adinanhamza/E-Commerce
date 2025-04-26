import 'package:flutter/material.dart';

class DeliveryAddressWidget extends StatelessWidget {
   DeliveryAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Icon(Icons.location_on_outlined),
         SizedBox(),
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Delivery address'),
            Row(
              children: [
                Text(
                  '7491 Elm Street, Springfield',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ],
        ),
         Spacer(),
        Stack(
          alignment: Alignment.topRight,
          children: [
            IconButton(
              onPressed: () {},
              icon:  Icon(Icons.notifications_outlined),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 8,
                height: 8,
                decoration:  BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
