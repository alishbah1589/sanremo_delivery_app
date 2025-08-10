// import 'package:flutter/material.dart';

// class DeliveryOption extends StatelessWidget {
//   const DeliveryOption({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card.outlined(
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
//             const Text(
//               "Delivery options",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             const SizedBox(height: 10),

//             deliveryOption(
//               title: "Saver",

//               subtitle: "20 - 35 mins",
//               extra: "-Rs. 20.00",
//             ),

//             const SizedBox(height: 10),
//             deliveryOption(
//               title: "Standard",
//               subtitle: "10 - 25 mins",
//               selected: true,
//             ),
//             const SizedBox(height: 8),
//             deliveryOption(
//               title: "Priority",
//               subtitle: "5 - 20 mins",
//               extra: "+ Rs. 70.00",
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }


// Widget deliveryOption({
//   required String title,
//   required String subtitle,
//   String? extra,
//   bool selected = false,
// }) {
//   return Container(
//     decoration: BoxDecoration(
//       border: Border.all(
//         color: selected ? Colors.black : Colors.grey,
//         width: selected ? 1.5 : 1,
//       ),
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: ListTile(
//       title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
//       subtitle: Text(subtitle),
//       trailing: extra != null ? Text(extra) : null,
//     ),
//   );
// }
import 'package:flutter/material.dart';

class DeliveryOption extends StatelessWidget {
  const DeliveryOption({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Dynamic sizing
    final double cardPadding = screenWidth * 0.04; // 4% of width
    final double fontSizeTitle = (screenWidth * 0.045).clamp(14, 20); // 14–20px
    final double fontSizeSubtitle = (screenWidth * 0.04).clamp(12, 18); // 12–18px
    final double gapSmall = screenHeight * 0.012; // 1.2% of height
    final double gapLarge = screenHeight * 0.02; // 2% of height

    return Card.outlined(
      elevation: 9,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(screenWidth * 0.04), // 4% margin
      child: Padding(
        padding: EdgeInsets.all(cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Delivery options",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSizeTitle,
              ),
            ),
            SizedBox(height: gapSmall),

            deliveryOption(
              title: "Saver",
              subtitle: "20 - 35 mins",
              extra: "-Rs. 20.00",
              titleFontSize: fontSizeSubtitle,
              subtitleFontSize: fontSizeSubtitle * 0.9,
            ),

            SizedBox(height: gapSmall),

            deliveryOption(
              title: "Standard",
              subtitle: "10 - 25 mins",
              selected: true,
              titleFontSize: fontSizeSubtitle,
              subtitleFontSize: fontSizeSubtitle * 0.9,
            ),

            SizedBox(height: gapSmall),

            deliveryOption(
              title: "Priority",
              subtitle: "5 - 20 mins",
              extra: "+ Rs. 70.00",
              titleFontSize: fontSizeSubtitle,
              subtitleFontSize: fontSizeSubtitle * 0.9,
            ),

            SizedBox(height: gapLarge),
          ],
        ),
      ),
    );
  }
}

Widget deliveryOption({
  required String title,
  required String subtitle,
  String? extra,
  bool selected = false,
  required double titleFontSize,
  required double subtitleFontSize,
}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: selected ? Colors.black : Colors.grey,
        width: selected ? 1.5 : 1,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: titleFontSize,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: subtitleFontSize),
      ),
      trailing: extra != null
          ? Text(
              extra,
              style: TextStyle(fontSize: subtitleFontSize),
            )
          : null,
    ),
  );
}
