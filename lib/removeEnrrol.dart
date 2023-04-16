// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// void removeMDMEnrollmentInformation(BuildContext context) async {
//   if (Platform.isMacOS) {
//     try {
//       final mdmClientOutput =
//       await Process.run('mdmclient', ['enroll', '-delete']);
//       final message =
//           'MDM enrollment information has been removed: ${mdmClientOutput.stdout}';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(message),
//         ),
//       );
//     } on PlatformException catch (_) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error removing MDM enrollment information.'),
//         ),
//       );
//     }
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('This function is only available on macOS.'),
//       ),
//     );
//   }
// }
