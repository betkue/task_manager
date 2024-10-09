import 'package:flutter/material.dart';
import 'package:task_manager/src/blocs/task_item.dart';

class TaskLister extends StatefulWidget {
  final String? priority;
  final int state;
  const TaskLister({super.key, required this.priority, required this.state});

  @override
  State<TaskLister> createState() => _TaskListerState();
}

class _TaskListerState extends State<TaskLister> {
  List<Map> tasks = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //   tasks.map((task) =>
        // TaskItem()
        // )
      ],
    );
  }
}
