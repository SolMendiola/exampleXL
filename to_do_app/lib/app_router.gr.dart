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
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: MyHomePage(),
      );
    },
    NewTaskScreenRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const NewTaskScreen(),
        maintainState: false,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DetailOfTaskRoute.name: (routeData) {
      final args = routeData.argsAs<DetailOfTaskRouteArgs>();
      return CustomPage<dynamic>(
        routeData: routeData,
        child: DetailOfTask(
          key: args.key,
          index: args.index,
        ),
        transitionsBuilder: TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
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
        RouteConfig(
          DetailOfTaskRoute.name,
          path: '/detail-of-task',
        ),
      ];
}

/// generated route for
/// [MyHomePage]
class MyHomePageRoute extends PageRouteInfo<void> {
  const MyHomePageRoute()
      : super(
          MyHomePageRoute.name,
          path: '/',
        );

  static const String name = 'MyHomePageRoute';
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

/// generated route for
/// [DetailOfTask]
class DetailOfTaskRoute extends PageRouteInfo<DetailOfTaskRouteArgs> {
  DetailOfTaskRoute({
    Key? key,
    required int index,
  }) : super(
          DetailOfTaskRoute.name,
          path: '/detail-of-task',
          args: DetailOfTaskRouteArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'DetailOfTaskRoute';
}

class DetailOfTaskRouteArgs {
  const DetailOfTaskRouteArgs({
    this.key,
    required this.index,
  });

  final Key? key;

  final int index;

  @override
  String toString() {
    return 'DetailOfTaskRouteArgs{key: $key, index: $index}';
  }
}
