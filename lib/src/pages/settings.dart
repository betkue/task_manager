import 'package:flutter/material.dart';
import 'package:task_manager/src/styles/styles.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPage,
      body: Center(
        child: Text("Settings"),
      ),
    );
    ;
  }
}
