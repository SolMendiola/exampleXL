import 'dart:async';

import '../domain/card_to_do.dart';

class RepositoryTask {
  final _streamController = StreamController<List<CardToDo>>.broadcast();
  List<CardToDo> _elements = [];

  RepositoryTask._privateConstructor() {
    _streamController.add([]);
    _streamController.stream.listen((event) {
      _elements = event;
    });
  }

  static final RepositoryTask _instance = RepositoryTask._privateConstructor();

  factory RepositoryTask() {
    return _instance;
  }

  void saveTask(CardToDo taskToAdd) {
    final elements = _elements.toList();
    elements.add(taskToAdd);
    _streamController.add(elements);
  }

  void removeTask(CardToDo task) {
    final elements = _elements.toList();
    elements.remove(task);
    _streamController.add(elements);
  }

  Stream<List<CardToDo>> getTasksStream() => _streamController.stream;

  Stream<CardToDo> getTaskStream(int index) => _streamController.stream
      .map((list) => list[index])
      .distinct((old, newe) => old.done == newe.done);

  List<CardToDo> getTasks() => _elements;

  CardToDo getTask(int index) => _elements[index];

  void update(int index, bool done) {
    final elements = _elements.toList();
    elements[index] = elements[index].copyWith(done: done);
    _streamController.add(elements);
  }

  void clearAllDone() {
    final list =
        _elements.map((element) => element.copyWith(done: false)).toList();
    _streamController.add(list);
  }
}
