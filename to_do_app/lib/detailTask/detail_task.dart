import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/domain/card_to_do.dart';

import '../repository/repository_task.dart';

class DetailOfTask extends StatelessWidget {

  final CardToDo element;
  DetailOfTask({
    Key? key,
    required this.element,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text('Detail', textAlign: TextAlign.center),
          leading: TextButton(
              onPressed: context.router.pop,
              child: Text('Todos', style: TextStyle(color: Colors.white)))),
      body: Container(
        width: 375,
        height: 262,
        decoration: BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(element.done ? 'Done' : 'Not done',
                style: TextStyle(color: Colors.pinkAccent)),
            Text(element.title,
                style: TextStyle(color: Colors.black, fontSize: 34)),
            Text(element.description),
            if (!element.done)
              TextButton(
                  onPressed: null,
                  child: Text(
                    'MARK AS DONE',
                    style: TextStyle(color: Colors.pinkAccent),
                  ))
          ],
        ),
      ),
    );
  }
}
