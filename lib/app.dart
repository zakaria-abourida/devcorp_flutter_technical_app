import 'package:devcorp_flutter_technical_test/pallete_color.dart';
import 'package:devcorp_flutter_technical_test/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 929),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: 'App',
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.home,
            getPages: Routes.getPages,
            theme: ThemeData(
              scaffoldBackgroundColor: Palette.bgColor,
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
          );
        });
  }
}
