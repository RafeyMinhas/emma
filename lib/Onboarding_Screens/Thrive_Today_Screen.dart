import 'package:emma_ui_project/Utils/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:emma_ui_project/Other_Screens/Drawer_screen.dart';

class ThriveToday extends StatelessWidget {
  const ThriveToday({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Builder(
        builder: (context) => Container(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Thrive Today",
                  style: TextStyle(
                    color: const Color(0xFFFFC107),
                    fontSize: 35.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 210.h,
                width: 215.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Image.asset(
                    "Assets/Hi_Emma.png", // Replace with your image path
                    height: 200.h,
                    width: 180.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // Attach the CustomDrawer
    );
  }
}
