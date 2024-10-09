import 'package:flutter/material.dart';
import 'package:task_manager/src/styles/styles.dart';

class MenuItem extends StatelessWidget {
  final Widget icon;
  final String text;
  final String subtitle;
  final Function ontab;

  MenuItem(
      {required this.icon,
      required this.text,
      required this.subtitle,
      required this.ontab});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? blackColor
              : Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: icon,
        title: Text(text,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : blackColor)),
        subtitle: subtitle.isNotEmpty
            ? Text(
                subtitle,
                style: const TextStyle(
                    color: gray2Color, fontWeight: FontWeight.bold),
              )
            : null,
        trailing: const Icon(
          Icons.chevron_right,
          color: gray2Color,
          weight: 10,
        ),
        onTap: () {
          ontab();
        },
      ),
    );
  }
}
