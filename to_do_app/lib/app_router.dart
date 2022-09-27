import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'addTask/new_task.dart';
import 'detailTask/detail_task.dart';
import 'domain/card_to_do.dart';
import 'home/my_home_page.dart';

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
