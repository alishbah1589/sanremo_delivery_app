import 'package:flutter/material.dart';

class SwitchText extends StatelessWidget {
  final ValueNotifier<bool> isSwitched = ValueNotifier(false);
  SwitchText({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Dynamic font size (min 12, max 18)
    final double fontSize = (screenWidth * 0.04).clamp(12, 18);

    // Dynamic padding
    final double horizontalPadding = screenWidth * 0.04;
    final double verticalPadding = screenHeight * 0.01;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: ValueListenableBuilder<bool>(
        valueListenable: isSwitched,
        builder: (context, value, child) {
          return SwitchListTile(
            contentPadding: EdgeInsets.zero, // Keep padding consistent
            value: value,
            onChanged: (val) {
              isSwitched.value = val;
            },
            title: Text(
              "Change issues? You can ask the rider to top-up your wallet.",
              style: TextStyle(fontSize: fontSize),
            ),
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class SwitchText extends StatelessWidget {
//   final ValueNotifier<bool> isSwitched = ValueNotifier(false);
//   SwitchText({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ValueListenableBuilder<bool>(
//         valueListenable: isSwitched,
//         builder: (context, value, child) {
//           return SwitchListTile(
//             value: value,
//             onChanged: (val) {
//               isSwitched.value = val;
//             },
//             title: Text(
//               "Change issues? You can ask the rider to top-up your wallet.",
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
