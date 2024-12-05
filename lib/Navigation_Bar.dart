import 'dart:math';
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
  bool _isDrawerOpen = false;

  final List<Widget> _screens = [
    PageViewScreen(),
    const AskEmmaScreen(),
    const ActivityScreen(),
    const AboutYouScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Stack(
        children: [
          _screens[_currentIndex], // Page View for different screens

          // Overlay to dim the background when the drawer is open
          if (_isDrawerOpen)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isDrawerOpen = false;
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),

          // Drawer content that slides in
          if (_isDrawerOpen)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                height:
                    MediaQuery.of(context).size.height - 70, // Adjust height
                child: Column(
                  children: [
                    Text('Information', style: TextStyle(fontSize: 18.sp)),
                    // Add drawer content here
                  ],
                ),
              ),
            ),

          // Positioning the bottom navigation bar behind the drawer
          if (!_isDrawerOpen)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
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
            ),
        ],
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

  // This method will handle drawer opening
  void _openDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }
}
