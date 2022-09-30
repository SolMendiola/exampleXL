import 'package:flutter_bloc/flutter_bloc.dart';

import '../addTask/task_state.dart';
import '../domain/card_to_do.dart';
import '../repository/repository_task.dart';

class DetailTaskCubit extends Cubit<TaskState> {
  final repo = RepositoryTask();

  DetailTaskCubit()
      : super(
      TaskState(task: CardToDo(title: "", description: "", done: false)));

}