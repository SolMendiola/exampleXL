
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormToAddNewTask extends StatelessWidget {
  const FormToAddNewTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            hintText: 'Task Title',
          ),
        ),
        TextFormField(
          maxLines: 5,
          decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Task description',
              labelStyle: TextStyle(fontSize: 20)),
        ),
      ],
    );
  }
}
