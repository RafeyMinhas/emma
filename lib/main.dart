import 'package:emma_ui_project/Navigation_Bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Base design size (width x height)
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: NavigationBarScreen(),
        );
      },
    );
  }
}
