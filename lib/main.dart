import 'package:flutter/material.dart';
import 'package:system_automate/installer_sc.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 21, 24, 31),
        body: InstallationApp(),
      ),
    ),
  );
}
