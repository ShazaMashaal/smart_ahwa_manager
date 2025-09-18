
import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/core/routing/routes.dart';

import '../../features/addOrder/ui/add_order_screen.dart';
import '../../features/home/ui/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //This arguments should ne passed in any screen like this {arguments as ClassName}
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => AddOrderScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
