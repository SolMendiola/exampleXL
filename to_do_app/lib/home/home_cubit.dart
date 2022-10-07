import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/home/home_state.dart';

import '../addTask/task_state.dart';
import '../domain/card_to_do.dart';
import '../repository/repository_task.dart';

class HomeCubit extends Cubit<HomeState> {
  final taskRepository = RepositoryTask();

  HomeCubit()
      : super(
      HomeState(tasks: RepositoryTask().getTasks())){
    taskRepository.getTasksStream().listen((event) => emit(state.copyWith(tasks: event)));
  }

  void onChanged(int index, bool done) => taskRepository.update(index, done);

  void clearAllDone()=> taskRepository.clearAllDone();
}
