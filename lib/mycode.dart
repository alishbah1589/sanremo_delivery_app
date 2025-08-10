import 'package:flutter/material.dart';
import 'package:sanremo_food_delivery/components.dart';
import 'package:sanremo_food_delivery/delivry_option.dart';
import 'package:sanremo_food_delivery/location_address.dart';
import 'package:sanremo_food_delivery/payment_method.dart';
import 'package:sanremo_food_delivery/rider.dart';
import 'package:sanremo_food_delivery/switch_list_tile.dart';

class MyPart extends StatefulWidget {
  const MyPart({super.key});

  @override
  State<MyPart> createState() => _MyPartState();
}

class _MyPartState extends State<MyPart> {
  double subTotal = 300.00;
  double standardDelivery = 49.00;
  double platformFee = 7.99;
  double smallOrderFee = 34.00;
  late double totalAmount;

  @override
  void initState() {
    super.initState();
    _totalAmountCal();
  }

  void _totalAmountCal() {
    totalAmount = subTotal + standardDelivery + platformFee + smallOrderFee;
  }

  @override
  Widget build(BuildContext context) {
    double gap = 16; // Fixed gap instead of responsive calculation

    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Checkout"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16, // fixed horizontal padding
              vertical: 16,   // fixed vertical padding
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              locationAddress(),
                SizedBox(height: gap),
                SwitchText(),
                SizedBox(height: gap),
                DeliveryOption(),
                SizedBox(height: gap),
                RiderCard(),
                 SizedBox(height: gap),
                 PaymentMethod()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 30,
        surfaceTintColor: const Color.fromARGB(255, 79, 73, 73),
        child: SizedBox(
          height: 100, // fixed height for bottom section
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    Text(
                      "Total ",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    Text(
                      "(incl. fees and tax)",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontWeight: FontWeight.w200, fontSize: 12),
                    ),
                    const Spacer(flex: 2),
                    Text(
                      "Rs.",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    Text(
                      totalAmount.toStringAsFixed(2),
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 20),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: SizedBox(
                  width: 250,
                  child: roundedButton(
                    text: "Confirm Order",
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Your order has been placed successfully!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:sanremo_food_delivery/delivry_option.dart';
// import 'package:sanremo_food_delivery/location_address.dart';
// import 'package:sanremo_food_delivery/payment_method.dart';
// import 'package:sanremo_food_delivery/rider.dart';
// import 'package:sanremo_food_delivery/switch_list_tile.dart';

// class MyPart extends StatefulWidget {
//   const MyPart({super.key});

//   @override
//   State<MyPart> createState() => _MyPartState();
// }

// class _MyPartState extends State<MyPart> {
//   @override
//   Widget build(BuildContext context) {
//     // Screen size variables
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     // Dynamic spacing based on screen height
//     final double gap = screenHeight * 0.02; // 2% of screen height

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text("Checkout"),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(
//           horizontal: screenWidth * 0.04, // 4% horizontal padding
//           vertical: screenHeight * 0.02,  // 2% vertical padding
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             locationAddress(),
//             SizedBox(height: gap),
//             SwitchText(),
//             SizedBox(height: gap),
//             DeliveryOption(),
//             SizedBox(height: gap),
//             RiderCard(),
//             SizedBox(height: gap),
//             PaymentApp(),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:sanremo_food_delivery/delivry_option.dart';
// import 'package:sanremo_food_delivery/location_address.dart';
// import 'package:sanremo_food_delivery/payment_method.dart';
// import 'package:sanremo_food_delivery/rider.dart';
// import 'package:sanremo_food_delivery/switch_list_tile.dart';

// class mypart extends StatefulWidget {
//   const mypart({super.key});

//   @override
//   State<mypart> createState() => _mypartState();
// }

// class _mypartState extends State<mypart> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//          leading: IconButton(icon:const Icon(Icons.arrow_back),onPressed:() {},),
//         title: const Text("Checkout"),
//        ),
      
//       body: SingleChildScrollView(
        
//           // padding: const EdgeInsets.symmetric(
//           //   horizontal: 16,
//           //   vertical: 16,
//           // ), // fixed padding
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               locationAddress(),
           //     SizedBox(height: 0),
//               SwitchText(),
//                SizedBox(height: 60),
//               DeliveryOption(),
//               SizedBox(height: 60),
//               RiderCard(),
//                SizedBox(height: 60),
//               PaymentApp(),
             
             
             
//             ],
//           ),
//         ),
//       );
    

//   }
// }