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
        centerTitle: true,
        title: Text('Details', textAlign: TextAlign.center),
        leadingWidth: 100,
        leading: TextButton(
          onPressed: context.router.pop,
          child: Row(children: [
            Icon(Icons.arrow_back_ios, color: Colors.white),
            Text('Todos', style: TextStyle(fontSize: 17, color: Colors.white)),
          ]),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(element.done ? 'Done' : 'Not done',
                style: TextStyle(color: Colors.pinkAccent)),
            Text(element.title,
                style: TextStyle(color: Colors.black, fontSize: 34)),
            Text(element.description),
            if (!element.done)
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Center(
                    child:
                      TextButton(
                        onPressed: null,
                        child: Text(
                          'MARK AS DONE',
                          style: TextStyle(color: Colors.pinkAccent),
                        ),
                      ),
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
