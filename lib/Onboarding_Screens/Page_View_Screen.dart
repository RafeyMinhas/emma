import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Import your custom widgets and utility files
import 'package:emma_ui_project/Custom_Widgets/Activity_Card.dart';
import 'package:emma_ui_project/Onboarding_Screens/Acheive_Goals_Screen.dart';
import 'package:emma_ui_project/Onboarding_Screens/Keep_Going_Screen.dart';
import 'package:emma_ui_project/Onboarding_Screens/Thrive_Today_Screen.dart';
import 'package:emma_ui_project/Other_Screens/Drawer_screen.dart';
import 'package:emma_ui_project/Utils/App_Colors.dart';

class PageViewScreen extends StatelessWidget {
  PageViewScreen({super.key});

  final PageController pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // Key for Scaffold

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Set the scaffold key to control the drawer
      backgroundColor: AppColors.purple,
      drawer: const CustomDrawer(), // Your Drawer widget here
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: PageView(
                controller: pageController,
                children: const [
                  ThriveToday(),
                  KeepGoing(),
                  AcheiveGoals(),
                ],
              ),
            ),

            // Smooth Page Indicator at the top
            Positioned(
              top: 265.h,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: const WormEffect(
                    dotColor: AppColors.green,
                    activeDotColor: Colors.white,
                  ),
                ),
              ),
            ),

            // Activity Text "Activity" in yellow, positioned left below the smooth indicator
            Positioned(
              top: 275.h,
              left: 25.w,
              child: Text(
                'Activity',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // ".........." Text in black, centered below the "Activity" text
            Positioned(
              top: 290.h,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  '........................',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.sp,
                  ),
                ),
              ),
            ),

            // Activity Cards fixed at the bottom and scrollable
            Positioned(
              top: 325.h,
              left: 0,
              right: 0,
              bottom: 0, // Occupy the remaining space at the bottom
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ActivityCard(
                        icon: Icons.directions_run,
                        title: 'Exercise',
                        progress: 0.7,
                        status: 'On Track',
                        iconColor: Colors.red,
                        progressColor: Colors.red,
                      ),
                      SizedBox(height: 10.h),
                      const ActivityCard(
                        icon: Icons.bed,
                        title: 'Sleep',
                        progress: 0.5,
                        status: 'Need Improvement',
                        iconColor: AppColors.green,
                        progressColor: AppColors.green,
                      ),
                      SizedBox(height: 10.h),
                      const ActivityCard(
                        icon: Icons.personal_injury,
                        title: 'Doctor\'s Order',
                        progress: 0.8,
                        status: 'On Track',
                        iconColor: AppColors.blue,
                        progressColor: AppColors.blue,
                      ),
                      SizedBox(height: 10.h),
                      const ActivityCard(
                        icon: Icons.kitchen,
                        title: 'Diet',
                        progress: 0.5,
                        status: 'Going Strong',
                        iconColor: AppColors.purple,
                        progressColor: AppColors.purple,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Profile Image and Welcome Text
          ],
        ),
      ),
    );
  }
}
