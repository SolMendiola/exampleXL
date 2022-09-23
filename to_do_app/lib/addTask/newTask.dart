import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'formToAddNewTask.dart';

class NewTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            title: Text('New Task', textAlign: TextAlign.center),
            actions: [
              TextButton(
                  onPressed: () {},
                  child: Text('Save', style: TextStyle(color: Colors.white)))
            ],
            leading: TextButton(
                onPressed: context.router.pop,
                child: Text('Cancel', style: TextStyle(color: Colors.white)))),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: FormToAddNewTask(),
        ),
      );
}
