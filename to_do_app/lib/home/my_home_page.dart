import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/home/list_item.dart';

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
  final _saved = <CardToDo>{};

  @override
  void initState() {
    // TODO: implement initState
    _elements = repository.getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Todo',
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: _addElement, icon: const Icon(Icons.add))
          ],
        ),
        body: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              itemCount: _elements.length,
              itemBuilder: (context, index) {
                final alreadySaved = _saved.contains(_elements[index]);

                return ListItem(
                    element: _elements[index],
                    onChanged: (done) => onChanged(index, done ?? false),
                    viewDetail: () => viewDetail(_elements[index]));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(color: Colors.pinkAccent);
              },
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(10),
                child: TextButton(
                    onPressed: () => {},
                    child: Text('CLEAR ALL DONE',
                        style: TextStyle(color: Colors.pinkAccent))),
              ),
            )
          ],
        ));
  }

  void onChanged(int index, bool done) {
    setState(() {
      repository.update(index, done);
      _elements = repository.getTasks();
    });
  }

  void _addElement() => context.router.navigate(NewTaskScreenRoute());

  void viewDetail(CardToDo element) =>
      context.router.navigate(DetailOfTaskRoute(element: element));
}
