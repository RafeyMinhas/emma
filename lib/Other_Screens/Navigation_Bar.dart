import 'dart:math';
import 'package:emma_ui_project/Other_Screens/Drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:emma_ui_project/Utils/App_Colors.dart';
import 'package:emma_ui_project/Onboarding_Screens/Page_View_Screen.dart';
import 'package:emma_ui_project/Other_Screens/Activity_Screen.dart';
import 'package:emma_ui_project/Other_Screens/Ask_Emma_Screen.dart';
import 'package:emma_ui_project/Other_Screens/About_You_Scren.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _screens = [
    PageViewScreen(),
    const AskEmmaScreen(),
    const ActivityScreen(),
    const AboutYouScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),

      // Change background color based on selected screen
      backgroundColor: _currentIndex == 1 ? Colors.white : AppColors.purple,

      body: Stack(
        children: [
          _screens[_currentIndex],

          // Show Profile Section only on Home Screen (_currentIndex == 0)
          if (_currentIndex == 0)
            Positioned(
              top: 25.h,
              right: 15.w,
              child: GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 18.r,
                      backgroundImage:
                          const AssetImage("Assets/Profile_Pic.png"),
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Welcome,",
                      style: TextStyle(
                        color: const Color(0xFFFFC107),
                        fontSize: 10.sp,
                      ),
                    ),
                    Text(
                      "Claudia",
                      style: TextStyle(
                        color: const Color(0xFFFFC107),
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8.r,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            color: Colors.white,
            buttonBackgroundColor: AppColors.purple,
            height: min(60.0, 55.h),
            items: <Widget>[
              _buildIconWithText(Icons.home, 'Home', 0),
              _buildIconWithText(Icons.chat_bubble, 'Ask Emma', 1),
              _buildIconWithText(Icons.bar_chart, 'Activity', 2),
              _buildIconWithText(Icons.person, 'About You', 3),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildIconWithText(IconData icon, String label, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 28.sp,
          color: _currentIndex == index ? Colors.white : AppColors.purple,
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 10.sp,
            color: _currentIndex == index ? Colors.white : AppColors.purple,
          ),
        ),
      ],
    );
  }
}
