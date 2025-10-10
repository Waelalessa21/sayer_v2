// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';

// showProgressIndicator(BuildContext context) {
//   showDialog(
//     barrierColor: Colors.black.withOpacity(0),
//     barrierDismissible: false,
//     context: context,
//     builder: (BuildContext context) {
//       return BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 7, sigmaY: 5),
//         child: Center(
//           child: SizedBox(
//             width: 55.w,
//             height: 55.h,
//             child: Lottie.asset('assets/lottie/progress_indicator.json'),
//           ),
//         ),
//       );
//     },
//   );
// }

// Widget showProgressIndicatorWidget(double height) {
//   return Padding(
//     padding: EdgeInsets.symmetric(vertical: height),
//     child: SizedBox(
//       width: 150,
//       height: 150,
//       child: Center(
//         child: Lottie.network(
//           'https://lottie.host/bdfde562-68d8-4429-86e4-18db8d873b0e/inG3W7721f.json',
//         ),
//       ),
//     ),
//   );
// }
