import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'addTask/newTask.dart';
import 'detailTask/detailTask.dart';
import 'home/myHomePage.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(page: MyHomePage, initial: true, maintainState: false),
    AutoRoute(page: NewTaskScreen, initial: false, maintainState: false),
    AutoRoute(page: DetailOfTask, initial: false),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
