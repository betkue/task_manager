import 'package:flutter/material.dart';
import 'package:task_manager/src/styles/styles.dart';

class TaskItem extends StatefulWidget {
  final Map<String, dynamic> task;
  const TaskItem({super.key, required this.task});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
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
        leading: Icon(
          Icons.circle,
          color:
              getColorPriority(widget.task['priority']), //afficher la priorite
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
              maxLines: 3,
              style: const TextStyle(
                  color: gray2Color, fontWeight: FontWeight.bold),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              margin: EdgeInsets.only(top: 9),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: getColorState(widget.task[
                    'state']), //couleur du composant en fonction de la description
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                getTextState(widget.task['state']), // Texte de l'etat
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
    );
  }
}

getColorState(state) {
  switch (state) {
    case 0:
      return gray2Color;

    case 1:
      return greenColor;
    case 2:
      return redColor;
    default:
      return backgroundPage;
  }
}

getTextState(state) {
  switch (state) {
    case 0:
      return "Pending ...";

    case 1:
      return "Processing ...";
    case 2:
      return "End ...";
    default:
      return backgroundPage;
  }
}

getColorPriority(state) {
  switch (state) {
    case 'l':
      return gray2Color;

    case 'm':
      return greenColor;
    case 'h':
      return redColor;
    default:
      return backgroundPage;
  }
}
