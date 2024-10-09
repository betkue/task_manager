import 'package:flutter/material.dart';
import 'package:task_manager/src/styles/styles.dart';
import 'package:task_manager/src/utils/data.dart';

// presentation du mode d'enregistrement
class OnlineMode extends StatefulWidget {
  const OnlineMode({super.key});

  @override
  State<OnlineMode> createState() => _OnlineModeState();
}

class _OnlineModeState extends State<OnlineMode> {
  bool mode = internet;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(mode ? "On line" : "Off line"),
        Transform.scale(
          scale: 0.7,
          child: Switch(
              activeColor: greenColor,
              value: mode,
              onChanged: (e) {
                setState(() {
                  // mode = !mode;
                });
              }),
        )
      ],
    );
  }
}
