import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/src/blocs/online_mode.dart';
import 'package:task_manager/src/blocs/task_lister.dart';
import 'package:task_manager/src/pages/create_task.dart';
import 'package:task_manager/src/styles/styles.dart';
import 'package:task_manager/src/utils/sercive_provider.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int? stateTask; //etat d'avensement des taches
  String? selectedPriority; // priorite
  void change(int? a) {
    setState(() {
      stateTask = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context); // provider
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateTask()));
        },
        elevation: 4,
        backgroundColor: orangeColor,
        child: Icon(
          Icons.add,
          color: grayColor,
        ),
      ),
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/logo.png',
        ),
        title: const Text("Tasks List"),
        actions: const [OnlineMode()],
      ),
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? DarkColors.background
          : LightColors.background,
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.filter_list,
                      color: gray2Color,
                    ), // Icône de filtre
                    onSelected: (String value) {
                      setState(() {
                        selectedPriority = value == 'n' ? null : value;
                      });
                    },
                    //liste de priorite
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'n',
                        child: Text('All'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'l',
                        child: Text('Low'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'm',
                        child: Text('Medium'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'h',
                        child: Text('High'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      change(null);
                    },
                    child:
                        title("All", width, height, stateTask == null, context),
                  ),
                  GestureDetector(
                    onTap: () {
                      change(0);
                    },
                    child: title(
                        "Not Started", width, height, stateTask == 0, context),
                  ),
                  GestureDetector(
                    onTap: () {
                      change(1);
                    },
                    child: title(
                        "In Progress", width, height, stateTask == 1, context),
                  ),
                  GestureDetector(
                    onTap: () {
                      change(2);
                    },
                    child: title(
                        "Completed", width, height, stateTask == 2, context),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
                child: TaskLister(
                    priority: selectedPriority, state: stateTask)) //content
          ],
        ),
      ),
    );
  }
}

//mise en forme des selecteurs d'etat
Widget title(
    String title, double width, double height, bool isActive, context) {
  return Container(
    margin: EdgeInsets.only(right: 4),
    child: Material(
      borderRadius: BorderRadius.circular(5),
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).brightness == Brightness.dark
          ? DarkColors.background
          : LightColors.background,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: !isActive ? gray2Color : orangeColor,
              fontSize: 15,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  );
}
