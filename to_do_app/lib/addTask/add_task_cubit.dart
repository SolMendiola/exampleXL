import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/addTask/task_state.dart';
import 'package:to_do_app/domain/card_to_do.dart';
import 'package:to_do_app/repository/repository_task.dart';

class AddTaskCubit extends Cubit<TaskState> {
  final repo = RepositoryTask();
  AddTaskCubit()
      : super(
            TaskState(task: CardToDo(title: "", description: "", done: false)));

  void changeDescription(String description) => emit(state.copyWith(
      task: state.task.copyWith(
        description: description,
      ),
    ));

  void changeTitle(String title)=> emit(state.copyWith(
      task: state.task.copyWith(
        title: title,
      )
    ));

  void save() => repo.saveTask(state.task);
}
