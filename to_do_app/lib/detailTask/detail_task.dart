import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/domain/card_to_do.dart';

import '../addTask/task_state.dart';
import '../repository/repository_task.dart';
import 'detail_task_cubit.dart';

class DetailOfTask extends StatelessWidget {
  final int index;

  DetailOfTask({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DetailTaskCubit(index),
      child: DetailContent(),
    );
  }
}


class DetailContent extends StatelessWidget {
  const DetailContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DetailTaskCubit>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Details', textAlign: TextAlign.center),
        leadingWidth: 100,
        leading: TextButton(
          onPressed: context.router.pop,
          child: Row(children: [
            Icon(Icons.arrow_back_ios, color: Colors.white),
            Text('Todos', style: TextStyle(fontSize: 17, color: Colors.white)),
          ]),
        ),
      ),
      body: Container(
        width: double.infinity,
//        height: 262,
        decoration: BoxDecoration(color: Colors.white),
        padding:
        const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 20),
        child: BlocBuilder<DetailTaskCubit, TaskState>(
          builder: (BuildContext context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(state.task.done ? 'Done' : 'Not done',
                  style: TextStyle(color: Colors.pinkAccent)),
              Text(state.task.title,
                  style: TextStyle(color: Colors.black, fontSize: 34)),
              Text(state.task.description),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => cubit.doneButtom(),
                          child: Text(
                            state.task.done ? 'Mark as not done' : 'Mark as done',
                            style: TextStyle(color: Colors.pinkAccent),
                          ),
                        ),
                      ]),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


