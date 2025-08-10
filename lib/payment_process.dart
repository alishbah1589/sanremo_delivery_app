import 'package:flutter/material.dart';
import 'package:sanremo_food_delivery/main.dart';
import 'package:sanremo_food_delivery/mycode.dart';
import 'package:sanremo_food_delivery/payment_method.dart';


class PaymentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PaymentMethodScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String _selectedMethod = 'Cash';

  final List<Map<String, dynamic>> paymentMethods = [
    {'label': 'Cash', 'icon': Icons.payments, 'type': 'radio'},

    {
      'label': 'JazzCash',
      'icon': Icons.account_balance_wallet,
      'type': 'arrow',
    },
    {
      'label': 'Credit or Debit Card',
      'icon': Icons.credit_card,
      'type': 'arrow',
    },
    {'label': 'Easypaisa', 'icon': Icons.mobile_friendly, 'type': 'radio'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a payment method'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          ...paymentMethods.map((method) {
            return ListTile(
              leading: Icon(method['icon'], color: Colors.black),
              title: Text(
                method['label'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: method['type'] == 'radio'
                  ? (_selectedMethod == method['label']
                        ? const Icon(
                            Icons.radio_button_checked,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.radio_button_off,
                            color: Colors.grey,
                          ))
                  : const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
              onTap: () {
                if (method['type'] == 'radio') {
                  setState(() {
                    _selectedMethod = method['label'];
                  });
                } else {
                  print("Open page for ${method['label']}");
                  
                }
              },
            );
          }).toList(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPart()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
