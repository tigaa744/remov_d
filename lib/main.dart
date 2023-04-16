import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      title: 'MDM Removal',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final _profileIdentifierController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MDM Removal'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => removeMDMEnrollmentInformation(context),
              child: Text('Remove MDM Enrollment Information'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _profileIdentifierController,
              decoration: InputDecoration(
                labelText: 'Profile Identifier',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => removeMDMConfigurationProfile(
                  context, _profileIdentifierController.text),
              child: Text('Remove MDM Configuration Profile'),
            ),
            SizedBox(height: 16.0),
            Text('Results will appear here'),
          ],
        ),
      ),
    );
  }
}

void removeMDMEnrollmentInformation(BuildContext context) async {
  if (Platform.isMacOS) {
    try {
      final mdmClientOutput =
      await //Process.run('mdmclient', ['enroll', '-delete']);
      Process.runSync(
          'sudo', ['profiles', 'remove', '-identifier', 'com.apple.mdm']); // i will add mdmclient instaed sudo
      final message =
          'MDM enrollment information has been removed: ${mdmClientOutput.stdout}';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    } on PlatformException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error removing MDM enrollment information.'),
        ),
      );
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('This function is only available on macOS.'),
      ),
    );
  }
}

void removeMDMConfigurationProfile(
    BuildContext context, String profileIdentifier) async {
  if (Platform.isMacOS) {
    try {
      final profilesOutput =
      await //Process.run('profiles', ['remove', '-identifier', profileIdentifier]);
      Process.runSync('profiles', ['remove', '-all']);

      final message =
          'MDM configuration profile has been removed: ${profilesOutput.stdout}';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    } on PlatformException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error removing MDM configuration profile.'),
        ),
      );
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('This function is only available on macOS.'),
      ),
    );
  }
}
