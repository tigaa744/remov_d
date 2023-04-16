// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// void removeMDMConfigurationProfile(
//     BuildContext context, String profileIdentifier) async {
//   if (Platform.isMacOS) {
//     try {
//       final profilesOutput =
//       await Process.run('profiles', ['remove', '-identifier', profileIdentifier]);
//       final message =
//           'MDM configuration profile has been removed: ${profilesOutput.stdout}';
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(message),
//         ),
//       );
//     } on PlatformException catch (_) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error removing MDM configuration profile.'),
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
