import 'package:flutter/material.dart';

import 'package:sanremo_food_delivery/payment_process.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Icons.payment),

                
             const   Text(
                  "Payment method",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(left: 200)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentApp()),
                    );
                  },
                  child:const Text(
                    'change',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),
          const  Row(
              children: [
                Icon(Icons.money),
                Text('cash'),
                Padding(padding: EdgeInsets.only(left: 280)),
                Text("Rs.305.99"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
