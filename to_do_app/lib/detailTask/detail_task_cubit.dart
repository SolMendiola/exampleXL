import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../addTask/task_state.dart';
import '../domain/card_to_do.dart';
import '../repository/repository_task.dart';

class DetailTaskCubit extends Cubit<TaskState> {
  final repo = RepositoryTask();
  final CardToDo element;
  final int index;
  StreamSubscription<CardToDo>? subscription;

  DetailTaskCubit(this.index)
      : element = RepositoryTask().getTask(index),
        super(TaskState(task: RepositoryTask().getTask(index))) {
    subscription = repo.getTaskStream(index).listen((event) {
      emit(state.copyWith(task: event));
    });
  }

  CardToDo getTask() => repo.getTask(index);

  void doneButtom() => repo.update(index, !state.task.done);

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
