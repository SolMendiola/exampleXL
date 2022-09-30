import 'dart:async';

import '../domain/card_to_do.dart';

class RepositoryTask {
  RepositoryTask._privateConstructor();

  static final RepositoryTask _instance = RepositoryTask._privateConstructor();

   factory RepositoryTask() {
    return _instance;
  }

  final _streamController = StreamController<List<CardToDo>>.broadcast();

  final List<CardToDo> _elements = [];

  void saveTask(CardToDo taskToAdd) {
    _elements.add(taskToAdd);
    _streamController.add(_elements);
  }

  void removeTask(CardToDo task) {
    _elements.remove(task);
    _streamController.add(_elements);
  }

  Stream<List<CardToDo>> getTaskStream() => _streamController.stream;

  List<CardToDo> getTasks() => _elements;

  void update(int index, bool done) =>
      _elements[index] = _elements[index].copyWith(done: done);
}
