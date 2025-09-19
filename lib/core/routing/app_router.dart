
import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/core/routing/routes.dart';
import '../../features/home/logic/order_service.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/pendingOrders/ui/pending_orders_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //This arguments should ne passed in any screen like this {arguments as ClassName}
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.pendingOrdersScreen:
        if (arguments is OrderService) {
          return MaterialPageRoute(
            builder: (_) => PendingOrdersScreen(service: arguments),
          );
        } else {
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No service provided for PendingOrdersScreen'),
              ),
            ),
          );
        }
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
