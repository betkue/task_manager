import 'package:flutter/material.dart';
import 'package:task_manager/src/pages/create_task.dart';
import 'package:task_manager/src/styles/styles.dart';

class TaskItem extends StatefulWidget {
  final Map<String, dynamic> task;
  final int index;
  const TaskItem({super.key, required this.task, required this.index});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreateTask(
                      index: widget.index,
                      task: widget.task,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? blackColor
                : Colors.white,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: getColorPriority(widget.task['priority']),
                // Theme.of(context).brightness == Brightness.dark
                //     ? gray2Color
                //     : const Color.fromARGB(255, 78, 77, 77),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Start at : ${widget.task['expectedBegin']!.day}-${widget.task['expectedBegin']!.month}-${widget.task['expectedBegin']!.year} ${widget.task['expectedBegin']!.hour}:${widget.task['expectedBegin']!.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  widget.task['expectedEnd'] == null
                      ? Container()
                      : Text(
                          'End at : ${widget.task['expectedEnd']!.day}-${widget.task['expectedEnd']!.month}-${widget.task['expectedEnd']!.year} ${widget.task['expectedEnd']!.hour}:${widget.task['expectedEnd']!.minute.toString().padLeft(2, '0')}',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.circle,
                color: getColorPriority(
                    widget.task['priority']), //afficher la priorite
              ),
              title: Text(widget.task['title'], //titre
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : blackColor)),

              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.task['description'], //description
                    maxLines: 2,
                    style: const TextStyle(
                        color: gray2Color, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    margin: const EdgeInsets.only(top: 9),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: getColorState(widget.task[
                          'state']), //couleur du composant en fonction de la description
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      getTextState(widget.task['state']), // Texte de l'etat
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              trailing: const Icon(
                Icons.chevron_right,
                color: gray2Color,
                weight: 10,
              ),
              // onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

getColorState(state) {
  switch (state) {
    case 0:
      return gray2Color;

    case 1:
      return orangeColor;
    case 2:
      return greenColor;
    default:
      return backgroundPage;
  }
}

getTextState(state) {
  switch (state) {
    case 0:
      return "Not Started";

    case 1:
      return "In Progress";
    case 2:
      return "Completed";
    default:
      return "";
  }
}

getColorPriority(state) {
  switch (state) {
    case 'l':
      return orangeColor;

    case 'm':
      return greenColor;
    case 'h':
      return redColor;
    default:
      return backgroundPage;
  }
}
