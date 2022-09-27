import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/domain/card_to_do.dart';

import '../repository/repository_task.dart';
import 'formToAddNewTask.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            title: Text('New Task', textAlign: TextAlign.center),
            actions: [
              TextButton(
                  onPressed: () => saveTask(context),
                  child: Text('Save', style: TextStyle(color: Colors.white)))
            ],
            leading: TextButton(
                onPressed: Navigator.of(context).pop,
                child: Text('Cancel', style: TextStyle(color: Colors.white)))),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: FormToAddNewTask(
            titleController: titleController,
            descriptionController: descriptionController,
          ),
        ),
      );

  saveTask(BuildContext context) {
    var titleTask = titleController.text;
    var descriptionTask = descriptionController.text;
    var isDone = false;

    final task =
        CardToDo(title: titleTask, description: descriptionTask, done: isDone);

    final repository = RepositoryTask();
    repository.saveTask(task);
    context.router.pop();
  }
}
