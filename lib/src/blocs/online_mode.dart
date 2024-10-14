import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/src/styles/styles.dart';
import 'package:task_manager/src/utils/sercive_provider.dart';

// presentation du mode d'enregistrement
class OnlineMode extends StatefulWidget {
  const OnlineMode({super.key});

  @override
  State<OnlineMode> createState() => _OnlineModeState();
}

class _OnlineModeState extends State<OnlineMode> {
  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context); // provider

    return Container();
    // Row(
    //   children: [
    //     Text(serviceProvider.internet ? "On line" : "Off line"),
    //     Transform.scale(
    //       scale: 0.7,
    //       child: Switch(
    //           activeColor: greenColor,
    //           value: serviceProvider.internet,
    //           onChanged: (e) {
    //             setState(() {
    //               // mode = !mode;
    //             });
    //           }),
    //     )
    //   ],
    // );
  }
}
