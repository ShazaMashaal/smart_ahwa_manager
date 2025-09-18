import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theming/colors.dart';

class SmartAhwaManagerApp extends StatelessWidget {
  final AppRouter appRouter;

  const SmartAhwaManagerApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Doc App",
        theme: ThemeData(
            primaryColor: ColorsManager.mainBrown,
            scaffoldBackgroundColor: Colors.white

        ),
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}