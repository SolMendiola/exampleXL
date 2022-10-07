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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            style: TextStyle(fontSize: 36),
            decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.pink),
              ),
              border: UnderlineInputBorder(),
              hintText: 'Task title',
            ),
            validator: (value) => (value.isEmpty)
                  ? 'Please enter some text'
                  : null,
            controller: titleController,
          ),
          TextFormField(
            minLines: 4,
            maxLines: 10,
            style: TextStyle(fontSize: 14),
            decoration: const InputDecoration(
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
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
