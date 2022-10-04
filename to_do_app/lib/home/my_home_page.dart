import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/addTask/task_state.dart';
import 'package:to_do_app/home/home_cubit.dart';
import 'package:to_do_app/home/home_state.dart';
import 'package:to_do_app/home/list_item.dart';
import 'package:to_do_app/home/progress_widget.dart';

import '../app_router.dart';
import '../domain/card_to_do.dart';
import '../repository/repository_task.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: _HomeContent(),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => _addElement(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16.0),
                  itemCount: state.tasks.length,
                  itemBuilder: (context, index) {
                    return Hero(
                      tag: '/element.$index',
                      child:
                        ListItem(
                            element: state.tasks[index],
                            onChanged: (done) =>
                                cubit.onChanged(index, done ?? false),
                            viewDetail: () => viewDetail(context, index)),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(color: Colors.pinkAccent);
                  },
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () => cubit.clearAllDone(),
                      child: Text('CLEAR ALL DONE',
                          style: TextStyle(color: Colors.pinkAccent)),
                    ),
                  ),
                ),
                ProgressWidget(
                    totalValue: max(state.tasks.length,1),
                    currentValue:
                        state.tasks.where((element) => element.done).length)
              ],
            );
          },
        ),
      ),
    );
  }

  void _addElement(BuildContext context) =>
      context.router.navigate(NewTaskScreenRoute());

  void viewDetail(BuildContext context, int index) =>
      context.router.navigate(DetailOfTaskRoute(index: index));
}
