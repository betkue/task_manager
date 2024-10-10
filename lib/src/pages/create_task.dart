import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/src/blocs/online_mode.dart';
import 'package:task_manager/src/blocs/text-input.dart';
import 'package:task_manager/src/functions/base_functions.dart';
import 'package:task_manager/src/styles/styles.dart';
import 'package:task_manager/src/utils/sercive_provider.dart';

class CreateTask extends StatefulWidget {
  final Map<String, dynamic>? task;
  final int? index;
  const CreateTask({super.key, this.task, this.index});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  bool load = false;
  String description = '';
  String priority = 'l'; // Par défaut à 'l' pour faible
  DateTime? expectedBegin; // date pour commencer
  DateTime? expectedEnd; // date pour finir
  int state = 0; // 0 pour non commencée, 1 pour en cours, 2 pour terminée
  double margin = 16;

  @override
  void initState() {
    super.initState();

    if (widget.index != null && widget.task != null) {
      title = widget.task!['title'];
      description = widget.task!['description'];
      priority = widget.task!['priority']; // Par défaut à 'l' pour faible
      expectedBegin = widget.task!['expectedBegin']; // date pour commencer
      expectedEnd = widget.task!['expectedEnd']; // date pour finir
      state = widget.task![
          'state']; // 0 pour non commencée, 1 pour en cours, 2 pour terminée
    }
  }

  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context); // provider

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: gray2Color,
          ),
        ),
        title: Text((widget.index != null && widget.task != null)
            ? title
            : "Create Tasks"),
        actions: const [OnlineMode()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: margin,
              ),
              TextInput(
                  onsave: (value) {
                    title = value ?? '';
                  },
                  text: widget.task != null ? title : null,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a title.';
                    }
                    return null;
                  },
                  label: 'Title'),

              SizedBox(
                height: margin,
              ),

              DropdownButtonFormField<String>(
                value: priority,
                decoration: const InputDecoration(labelText: 'Priority'),
                items: [
                  const DropdownMenuItem(value: 'h', child: Text('High')),
                  const DropdownMenuItem(value: 'm', child: Text('Medium')),
                  const DropdownMenuItem(value: 'l', child: Text('Low')),
                ],
                onChanged: (value) {
                  setState(() {
                    priority = value!;
                  });
                },
              ),
              SizedBox(height: margin),
              // Sélection de la date de début
              TextButton(
                onPressed: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime
                        .now(), // Ne permet pas de choisir une date passée
                    lastDate: DateTime(2101), // Date maximale
                  );
                  if (picked != null) {
                    TimeOfDay? timePicked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (timePicked != null) {
                      setState(() {
                        expectedBegin = DateTime(
                          picked.year,
                          picked.month,
                          picked.day,
                          timePicked.hour,
                          timePicked.minute,
                        );
                      });
                    }
                  }
                },
                child: Text(
                  expectedBegin == null
                      ? 'Select Start Date'
                      : 'Start: ${expectedBegin!.day}-${expectedBegin!.month}-${expectedBegin!.year} ${expectedBegin!.hour}:${expectedBegin!.minute.toString().padLeft(2, '0')}',
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? LightColors.background
                          : DarkColors.background),
                ),
              ),
              SizedBox(height: margin),
              // Sélection de la date de fin
              expectedBegin == null
                  ? Container()
                  : TextButton(
                      onPressed: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime
                              .now(), // Ne permet pas de choisir une date passée
                          lastDate: DateTime(2101), // Date maximale
                        );
                        if (picked != null) {
                          TimeOfDay? timePicked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (timePicked != null) {
                            setState(() {
                              expectedEnd = DateTime(
                                picked.year,
                                picked.month,
                                picked.day,
                                timePicked.hour,
                                timePicked.minute,
                              );
                            });
                          }
                        }
                      },
                      child: Text(
                        expectedEnd == null
                            ? 'Select End Date'
                            : 'End: ${expectedEnd!.day}-${expectedEnd!.month}-${expectedEnd!.year} ${expectedEnd!.hour}:${expectedEnd!.minute.toString().padLeft(2, '0')}',
                        style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? LightColors.background
                                    : DarkColors.background),
                      ),
                    ),
              SizedBox(height: margin),
              DropdownButtonFormField<int>(
                value: state,
                decoration: const InputDecoration(labelText: 'State'),
                items: [
                  const DropdownMenuItem(value: 0, child: Text('Not Started')),
                  const DropdownMenuItem(value: 1, child: Text('In Progress')),
                  const DropdownMenuItem(value: 2, child: Text('Completed')),
                ],
                onChanged: (value) {
                  setState(() {
                    state = value!;
                  });
                },
              ),
              SizedBox(height: 2 * margin),

              TextInput(
                  maxLines: 5,
                  onsave: (value) {
                    description = value ?? '';
                  },
                  text: widget.task != null ? description : null,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a description.';
                    }
                    return null;
                  },
                  label: 'Description'),

              (title.isEmpty && expectedBegin == null && expectedEnd == null)
                  ? Container()
                  : InkWell(
                      onTap: () {
                        try {
                          if (_formKey.currentState!.validate() && !load) {
                            _formKey.currentState!.save();
                            setState(() {
                              load = true;
                            });
                            var task = {
                              'title': title,
                              'description': description,
                              'priority': priority,
                              'expectedBegin':
                                  expectedBegin, // Heure supposée de début
                              'expectedEnd':
                                  expectedEnd, // Heure supposée de fin
                              'actualBegin': null, // Heure réelle de début
                              'actualEnd': null, // Heure réelle de fin
                              'state': state, // État de la tâche
                            };

                            if (widget.index != null && widget.task != null) {
                              serviceProvider.toggleUpdateTasks(
                                  task, widget.index!);
                            } else {
                              serviceProvider.toggleAddTasks(task);
                            }

                            setState(() {
                              load = false;
                            });

                            Navigator.pop(context);
                          }
                        } catch (e) {
                          showToast("error", bgColor: redColor);
                        }
                      },
                      child: Center(
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          margin: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 30),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? LightColors.background
                                  : DarkColors.background,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              load
                                  ? "Load ..."
                                  : (widget.index != null &&
                                          widget.task != null)
                                      ? "Update task"
                                      : 'Create Task',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? DarkColors.background
                                      : LightColors.background),
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
