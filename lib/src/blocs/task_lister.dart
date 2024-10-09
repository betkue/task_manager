import 'package:flutter/material.dart';
import 'package:task_manager/src/blocs/task_item.dart';

class TaskLister extends StatefulWidget {
  final String? priority;
  final int? state;
  const TaskLister({super.key, required this.priority, required this.state});

  @override
  State<TaskLister> createState() => _TaskListerState();
}

class _TaskListerState extends State<TaskLister> {
  //task list
  List<Map<String, dynamic>> tasks = [
    {
      'title': 'Tâche 1',
      'description': 'Description de la tâche 1',
      'priority': 'l',
      'expectedBegin': TimeOfDay(hour: 9, minute: 0), // Heure supposée de début
      'expectedEnd': TimeOfDay(hour: 17, minute: 0), // Heure supposée de fin
      'actualBegin': null, // Heure réelle de début
      'actualEnd': null, // Heure réelle de fin
      'state': 2, // État de la tâche
    },
    {
      'title': 'Tâche 2',
      'description': 'Description de la tâche 2',
      'priority': 'h',
      'expectedBegin': TimeOfDay(hour: 10, minute: 30),
      'expectedEnd': TimeOfDay(hour: 15, minute: 0),
      'actualBegin': TimeOfDay(hour: 10, minute: 0), // Début réel
      'actualEnd': null, // Pas encore terminé
      'state': 0,
    },
    {
      'title': 'Tâche 3',
      'description': 'Description de la tâche 3',
      'priority': 'm',
      'expectedBegin': TimeOfDay(hour: 14, minute: 0),
      'expectedEnd': TimeOfDay(hour: 16, minute: 30),
      'actualBegin': TimeOfDay(hour: 14, minute: 15), // Début réel
      'actualEnd': TimeOfDay(hour: 16, minute: 0), // Fin réelle
      'state': 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(
          task: tasks[index],
        );
      },
    );
  }
}
