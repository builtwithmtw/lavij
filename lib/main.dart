import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lavij/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:lavij/constants/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Book',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.welcome,
      getPages: AppRoutes.routes,
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'RudawRegular',
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: AppColors.primary,
            secondary: AppColors.secondary,
          )),
    );
  }
}
