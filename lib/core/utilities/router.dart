import 'package:flutter/material.dart';
import 'package:skyline_template_app/ui/home_view.dart';
import 'package:skyline_template_app/ui/game_view.dart';
import 'package:skyline_template_app/core/utilities/route_names.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

/// Class that generates routes for the application
///   - Routes are generated by the list of routes in the app
///   - Routes can also require parameters. e.g. `PostDetailView(post: post)`
///
class Router {
  static String currentScreenName;

  static Route<dynamic> generateRoute(
      BuildContext context,
      RouteSettings settings,
      ) {
    return platformPageRoute(
      context: context,
      settings: RouteSettings(name: settings.name),
      builder: (context) => _generateRoute(settings),
      fullscreenDialog: _fullScreenDialogs.contains(settings.name),
    );
  }

  static Widget _generateRoute(RouteSettings settings) {
    //final arguments = settings.arguments;
    routeName(settings.name);
    switch (settings.name) {
      case HomeViewRoute:
        return HomeView();
      case GameViewRoute:
        return GameView();
      default:
        return Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        );
    }
  }

  static String routeName(String name) {
    currentScreenName = name;
    return name;
  }

  static final _fullScreenDialogs = [
    // Routes.route_1,
    // Routes.route_2,
  ];
}
