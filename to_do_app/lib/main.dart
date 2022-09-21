import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_router.dart';
import 'cardToDo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
        ),
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title = 'Test'});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

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
                onPressed: Navigator.of(context).pop,
                child: Text('Cancel', style: TextStyle(color: Colors.white)))),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: FormToAddNewTask(),
        ),
      );
}

class _MyHomePageState extends State<MyHomePage> {
  final _biggerFont = const TextStyle(fontSize: 18);
  final _elements = <String>[];
  final _saved = <String>{};

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
            var list = <String>[];
            list.add('hola');
            _elements.addAll(list);
          }

          final alreadySaved = _saved.contains(_elements[index]);

          return ListTile(
            title: GestureDetector(
              onTap: _viewDetail,
              child: Text(
                _elements[index],
                style: _biggerFont,
              ),
            ),
            subtitle: Text('Task description'),
            trailing: Icon(
              alreadySaved ? Icons.check_box : Icons.check_box_outline_blank,
              color: alreadySaved ? Colors.red : null,
            ),
            onTap: () {
              setState(() {
                if (alreadySaved) {
                  _saved.remove(_elements[index]);
                } else {
                  _saved.add(_elements[index]);
                }
              });
            },
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

  void _saveElement() {}

  void _viewDetail() {
    context.router.navigate(DetailOfTaskRoute());
  }
}
class DetailOfTask extends StatelessWidget {
  const DetailOfTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Detail', textAlign: TextAlign.center),
          leading: TextButton(
              onPressed: Navigator.of(context).pop,
              child:
                  Text('Todos', style: TextStyle(color: Colors.white)))),
      body: Container(
        width: 375,
        height: 262,
        decoration: BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(''),
            Text('Two-line item',
                style: TextStyle(color: Colors.black, fontSize: 34)),
            Text('Recently i came across an ....')
          ],
        ),
      ),
    );
  }
}

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
