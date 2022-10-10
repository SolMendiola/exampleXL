import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/addTask/add_task_cubit.dart';
import 'package:to_do_app/addTask/task_state.dart';
import 'package:to_do_app/domain/card_to_do.dart';

import '../repository/repository_task.dart';
import 'form_to_add_new_task.dart';


class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => AddTaskCubit(),
    child: NewTaskContent(),
  );

}

class NewTaskContent extends StatefulWidget {
  const NewTaskContent({Key? key}) : super(key: key);

  @override
  State<NewTaskContent> createState() => _NewTaskContentState();
}

class _NewTaskContentState extends State<NewTaskContent> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  late final AddTaskCubit cubit;

  @override
  void initState() {
    cubit = context.read<AddTaskCubit>();
    titleController.text = cubit.state.task.title;
    descriptionController.text = cubit.state.task.description;
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<AddTaskCubit, TaskState>(
    builder:(context, state) => Scaffold(
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
        ),
  );

  void saveTask(BuildContext context) {
    cubit.save();
    context.router.pop();
  }
}
