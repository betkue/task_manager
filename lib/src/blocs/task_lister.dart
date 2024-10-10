import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/src/blocs/task_item.dart';
import 'package:task_manager/src/utils/sercive_provider.dart';

class TaskLister extends StatefulWidget {
  final String? priority;
  final int? state;
  const TaskLister({super.key, required this.priority, required this.state});

  @override
  State<TaskLister> createState() => _TaskListerState();
}

class _TaskListerState extends State<TaskLister> {
  //task list

  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context); // provider

    return ListView.builder(
      itemCount: serviceProvider.tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(
          task: serviceProvider.tasks[index],
          index:index
        );
      },
    );
  }
}
