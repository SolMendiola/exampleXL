import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/home/listItem.dart';

import '../app_router.dart';
import '../domain/card_to_do.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title = 'Test'});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<CardToDo> _elements = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Expanded(child: Text(widget.title, textAlign: TextAlign.center)),
          IconButton(onPressed: _addElement, icon: const Icon(Icons.add))
        ],
      )),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: 2,
        itemBuilder: (context, index) {
          if (index >= _elements.length) {
            _elements
                .add(CardToDo(title: 'hola', description: 'fff', done: false));
          }

          var element = _elements[index];
          return ListItem(
              element: element,
              onChanged: (done) => onChanged(index, done ?? false),
              viewDetail: viewDetail);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.pinkAccent);
        },
      ),
    );
  }

  void onChanged(int index, bool done) => setState(() {
      // _elements[index].done = done;
    });

  void _addElement() => context.router.navigate(NewTaskScreenRoute());

  void viewDetail() => context.router.navigate(DetailOfTaskRoute());
}
