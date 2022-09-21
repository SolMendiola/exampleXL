import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/main.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(page: MyHomePage, initial: true),
    AutoRoute(page: NewTaskScreen, initial: false),
    AutoRoute(page: DetailOfTask, initial: false),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter{}