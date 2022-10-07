import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/domain/card_to_do.dart';

import '../repository/repository_task.dart';
import 'form_to_add_new_task.dart';

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
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () => saveTask(context),
              child: Text('Save', style: TextStyle(color: Colors.white)),
            )
          ],
          leading: TextButton(
            onPressed: context.router.pop,
            child: Text('Cancel', style: TextStyle(color: Colors.white)),
          ),
          leadingWidth: 63,
        ),
        backgroundColor: Color(0xFFF8F8F8),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20.0),
          child: FormToAddNewTask(
            titleController: titleController,
            descriptionController: descriptionController,
          ),
        ),
      );

  void saveTask(BuildContext context) {
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
