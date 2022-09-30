import 'package:flutter_bloc/flutter_bloc.dart';

import '../addTask/task_state.dart';
import '../domain/card_to_do.dart';
import '../repository/repository_task.dart';

class HomeCubit extends Cubit<List<TaskState>> {
  final repo = RepositoryTask();

  HomeCubit()
      : super(
      RepositoryTask().getTasks().map(map).toList()){
    repo.getTaskStream().listen((event) { emit(event.map(map).toList());});
  }


}


TaskState map(CardToDo task) => TaskState(task: task);