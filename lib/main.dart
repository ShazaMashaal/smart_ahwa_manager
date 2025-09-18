import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager/smart_ahwa_manager_app.dart';

import 'core/routing/app_router.dart';

void main() {
  runApp( SmartAhwaManagerApp(
    appRouter: AppRouter(),
  ));
}
