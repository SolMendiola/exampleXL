import 'package:flutter/material.dart';
import '../common/string_extension.dart';

class FormToAddNewTask extends StatelessWidget {
  FormToAddNewTask({
    Key? key,
    required this.titleController,
    required this.descriptionController,
  }) : super(key: key);

  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) => Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Task title',
            ),
            validator: (value) => (value.isEmpty)
                  ? 'Please enter some text'
                  : null,
            controller: titleController,
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Task description',
              labelStyle: TextStyle(fontSize: 20),
            ),
            validator: (value) => (value.isEmpty)
                  ? 'Please enter some text'
                  : null,
            controller: descriptionController,
          ),
        ],
      ),
  );
}
