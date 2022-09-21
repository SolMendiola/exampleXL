
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_router.dart';
import '../cardToDo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title = 'Test'});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  final _biggerFont = const TextStyle(fontSize: 18);
  final _elements = <CardToDo>[];
  final _saved = <CardToDo>{};

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
        itemBuilder: (context, i) {
          final index = i ~/ 2;
          if (index >= _elements.length) {
            var list = <CardToDo>[];
            list.add(CardToDo(title: 'hola', description: 'fff', done: false));
            _elements.addAll(list);
          }

          final alreadySaved = _saved.contains(_elements[index]);

          return GestureDetector(
            onTap: _viewDetail,
            child: ListTile(
              title: Text(
                _elements[index].title,
                style: _biggerFont,
              ),
              subtitle: Text(_elements[index].description),
              trailing: Checkbox(
                checkColor: Colors.red,
                value: _elements[index].done,
                onChanged: (_) {},
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }


  void _addElement() {
    context.router.navigate(NewTaskScreenRoute());
  }

  void _viewDetail() {
    context.router.navigate(DetailOfTaskRoute());
  }

}