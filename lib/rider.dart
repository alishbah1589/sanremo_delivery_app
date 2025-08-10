// import 'package:flutter/material.dart';

// class RiderCard extends StatefulWidget {
//   const RiderCard({super.key});

//   @override
//   State<RiderCard> createState() => _RiderCardState();
// }

// class _RiderCardState extends State<RiderCard> {
//   bool? ischecked = false;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 9,
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

//       margin: const EdgeInsets.all(16),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               "Tip your rider",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//             ),

//             const Text(
//               "100% of the tips go directly to your rider.Swipe left to view more tip options",
//             ),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 10,
//               runSpacing: 10,
//               children: [
//                 tipButton("Not now"),
//                 tipButton("Rs. 50.00"),
//                 tipButton("Rs. 100.00"),
//                 tipButton("Rs. 200.00"),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 Checkbox(
//                   value: ischecked,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       ischecked = value;
//                     });
//                   },
//                 ),
//                 Text('Save for your next order'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget tipButton(String text, {bool isHighlighted = false}) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//     decoration: BoxDecoration(
//       color: isHighlighted ? Colors.pink.shade100 : Colors.grey.shade200,
//       borderRadius: BorderRadius.circular(10),
//       border: Border.all(color: isHighlighted ? Colors.pink : Colors.grey),
//     ),
//     child: Text(text, style: const TextStyle(fontSize: 14)),
//   );
// }
import 'package:flutter/material.dart';

class RiderCard extends StatefulWidget {
  const RiderCard({super.key});

  @override
  State<RiderCard> createState() => _RiderCardState();
}

class _RiderCardState extends State<RiderCard> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    // Screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Dynamic sizing
    final double cardMargin = screenWidth * 0.04; // 4% of width
    final double cardPadding = screenWidth * 0.04; // 4% of width
    final double titleFontSize = (screenWidth * 0.055).clamp(18, 28);
    final double bodyFontSize = (screenWidth * 0.04).clamp(12, 18);
    final double tipFontSize = (screenWidth * 0.035).clamp(12, 16);
    final double gapSmall = screenHeight * 0.012;
    final double gapMedium = screenHeight * 0.02;

    return Card(
      elevation: 9,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(cardMargin),
      child: Padding(
        padding: EdgeInsets.all(cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Tip your rider",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: titleFontSize,
              ),
            ),
            SizedBox(height: gapSmall),
            Text(
              "100% of the tips go directly to your rider. Swipe left to view more tip options",
              style: TextStyle(fontSize: bodyFontSize),
            ),
            SizedBox(height: gapSmall),
            Wrap(
              spacing: screenWidth * 0.025,
              runSpacing: screenHeight * 0.012,
              children: [
                tipButton("Not now", fontSize: tipFontSize),
                tipButton("Rs. 50.00", fontSize: tipFontSize),
                tipButton("Rs. 100.00", fontSize: tipFontSize),
                tipButton("Rs. 200.00", fontSize: tipFontSize),
              ],
            ),
            SizedBox(height: gapMedium),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    'Save for your next order',
                    style: TextStyle(fontSize: bodyFontSize),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget tipButton(String text, {bool isHighlighted = false, required double fontSize}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: fontSize * 1.1, vertical: fontSize * 0.8),
    decoration: BoxDecoration(
      color: isHighlighted ? Colors.pink.shade100 : Colors.grey.shade200,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: isHighlighted ? Colors.pink : Colors.grey),
    ),
    child: Text(
      text,
      style: TextStyle(fontSize: fontSize),
    ),
  );
  
}
