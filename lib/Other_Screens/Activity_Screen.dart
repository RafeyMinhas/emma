import 'package:emma_ui_project/Custom_Widgets/Activity_Card.dart';
import 'package:emma_ui_project/Utils/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Activity",
              style: TextStyle(
                color: const Color(0xFFFFC107),
                fontSize: 35.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'Assets/Tree.png',
                    width: 80.w,
                    height: 80.h,
                  ),
                  Text(
                    "You've Planted\n17 Trees this month",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFFFFD700),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 40.r,
                        backgroundImage:
                            const AssetImage('Assets/Profile_Pic.png'),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Improving Your Life",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xFFFFD700),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 0.h),
                  Text(
                    "Hi, Claudia",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xFFFFD700),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.only(right: 160.w),
                child: Container(
                  // padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFBEC3B5),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Text(
                    "95 Days",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFFFD700),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Image.asset(
            'Assets/Activity_Tracker.png',
            fit: BoxFit.fitWidth,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    ActivityCard(
                      icon: Icons.directions_run,
                      title: 'Exercise',
                      progress: 0.7,
                      status: 'Details',
                      iconColor: Colors.red,
                      progressColor: Colors.red,
                    ),
                    SizedBox(height: 10),
                    ActivityCard(
                      icon: Icons.bed,
                      title: 'Sleep',
                      progress: 0.3,
                      status: ' Details',
                      iconColor: AppColors.green,
                      progressColor: AppColors.green,
                    ),
                    SizedBox(height: 10),
                    ActivityCard(
                      icon: Icons.personal_injury,
                      title: 'Doctor\'s Order',
                      progress: 0.5,
                      status: 'Details',
                      iconColor: AppColors.blue,
                      progressColor: AppColors.blue,
                    ),
                    SizedBox(height: 10),
                    ActivityCard(
                      icon: Icons.kitchen,
                      title: 'Diet',
                      progress: 0.5,
                      status: 'Details',
                      iconColor: AppColors.purple,
                      progressColor: AppColors.purple,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
