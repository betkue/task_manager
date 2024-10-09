import 'package:flutter/material.dart';
import 'package:task_manager/src/styles/styles.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPage,
      body: Center(
        child: Text("Tasks"),
      ),
    );
  }
}