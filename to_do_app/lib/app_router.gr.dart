// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    MyHomePageRoute.name: (routeData) {
      final args = routeData.argsAs<MyHomePageRouteArgs>(
          orElse: () => const MyHomePageRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: MyHomePage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    NewTaskScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: NewTaskScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          MyHomePageRoute.name,
          path: '/',
        ),
        RouteConfig(
          NewTaskScreenRoute.name,
          path: '/new-task-screen',
        ),
      ];
}

/// generated route for
/// [MyHomePage]
class MyHomePageRoute extends PageRouteInfo<MyHomePageRouteArgs> {
  MyHomePageRoute({
    Key? key,
    String title = 'Test',
  }) : super(
          MyHomePageRoute.name,
          path: '/',
          args: MyHomePageRouteArgs(
            key: key,
            title: title,
          ),
        );

  static const String name = 'MyHomePageRoute';
}

class MyHomePageRouteArgs {
  const MyHomePageRouteArgs({
    this.key,
    this.title = 'Test',
  });

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'MyHomePageRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [NewTaskScreen]
class NewTaskScreenRoute extends PageRouteInfo<void> {
  const NewTaskScreenRoute()
      : super(
          NewTaskScreenRoute.name,
          path: '/new-task-screen',
        );

  static const String name = 'NewTaskScreenRoute';
}
