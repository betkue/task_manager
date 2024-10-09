import 'package:flutter/material.dart';
import 'package:task_manager/src/blocs/online_mode.dart';
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
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/logo.png',
          height: 20,
        ),
        title: Text("Setting"),
        actions: const [OnlineMode()],
      ),
      backgroundColor: backgroundPage,
      body: Center(
        child: Text("Settings"),
      ),
    );
    ;
  }
}
