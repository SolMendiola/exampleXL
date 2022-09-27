import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/home/listItem.dart';

import '../app_router.dart';
import '../domain/card_to_do.dart';
import '../repository/repository_task.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title = 'Test'});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final repository = RepositoryTask();
  late var _elements;

  @override
  void initState() {
    _elements = repository.getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(child: Text(widget.title, textAlign: TextAlign.center)),
            IconButton(onPressed: _addElement, icon: const Icon(Icons.add))
          ],
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: _elements.length,
        itemBuilder: (context, index) => ListItem(
            element: _elements[index],
            onChanged: (done) => onChanged(index, done ?? false),
            viewDetail: () => viewDetail(index)),
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.pinkAccent);
        },
      ),
    );
  }

  void onChanged(int index, bool done) {
    setState(() {
      repository.update(index, done);
      _elements = repository.getTasks();
    });
  }

  void _addElement() => context.router.navigate(NewTaskScreenRoute());

  void viewDetail(int index) =>
      context.router.navigate(DetailOfTaskRoute(index: index));
}
