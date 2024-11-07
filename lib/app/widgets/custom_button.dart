// // custom_button.dart
// import 'package:flutter/material.dart';
// import 'package:screl_flutter_project/app/widgets/constants.dart';

// class CustomButton extends StatelessWidget {
//   final String label;
//   final VoidCallback onPressed;

//   const CustomButton({required this.label, required this.onPressed, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPressed,
//       child: Container(
//         padding: const EdgeInsets.all(6),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6),
//             border: Border.all(color: kPrimaryColor)),
//         child: Text(
//           label,
//           style: const TextStyle(color: kPrimaryColor),
//         ),
//       ),
//     );

//   }
// }

import 'package:flutter/material.dart';
import 'package:screl_flutter_project/app/widgets/constants.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isOutlined;
  final double? width;
  final double? height;

  const CustomButton({
    required this.label,
    required this.onPressed,
    this.isOutlined = false,
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isOutlined
        ? SizedBox(
            width: width,
            height: height ?? MediaQuery.of(context).size.height * 0.06,
            child: OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                side: BorderSide(color: kPrimaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                label,
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
          )
        : SizedBox(
            width: width,
            height: height ?? MediaQuery.of(context).size.height * 0.06,
          child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                label,
                style: const TextStyle(color: Colors.white),
              ),
            ),
        );
  }
}

// widgets/custom_button.dart
// import 'package:flutter/material.dart';
// import 'package:screl_flutter_project/app/widgets/constants.dart';

// class CustomButton extends StatelessWidget {
//   final String label;
//   final VoidCallback onPressed;

//   const CustomButton({required this.label, required this.onPressed, Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,

//       style: ElevatedButton.styleFrom(

//         backgroundColor: kPrimaryColor,
//         padding: EdgeInsets.symmetric(horizontal: kPadding),
//       ),
//       child: Text(label),
//     );
//   }
// }
