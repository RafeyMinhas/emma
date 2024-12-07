import 'package:emma_ui_project/Utils/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AskEmmaScreen extends StatelessWidget {
  const AskEmmaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Static Header
          Container(
            decoration: BoxDecoration(
              color: AppColors.purple,
              borderRadius: BorderRadius.circular(18.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Ask Emma",
                  style: TextStyle(
                    color: const Color(0xFFFFC107),
                    fontSize: 35.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),

                // Search Bar Row
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Icon(
                        Icons.menu,
                        size: 28.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search,
                                color: Colors.grey,
                                size: 20.sp), // Icon size remains the same
                            SizedBox(width: 8.w),
                            Expanded(
                              child: TextField(
                                style: TextStyle(
                                  fontSize: 16.sp, // Font size remains the same
                                  color: Colors.grey,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Ask Emma",
                                  hintStyle: TextStyle(
                                    fontSize: 16
                                        .sp, // Hint text size remains the same
                                    color: Colors.grey,
                                  ),
                                  border: InputBorder.none, // Removes underline
                                ),
                              ),
                            ),
                            Icon(Icons.message,
                                color: AppColors.purple,
                                size: 20.sp), // Icon size remains the same
                            SizedBox(width: 10.w),
                            Icon(Icons.phone,
                                color: AppColors.purple, size: 20.sp),
                            SizedBox(width: 10.w),
                            Icon(Icons.search,
                                color: AppColors.purple, size: 20.sp),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    CircleAvatar(
                      radius: 18.r,
                      backgroundImage: AssetImage("Assets/Profile_Pic.png"),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35.h),

                  // Wellness Trend and Goals Section
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _trendCard("Wellness Trend", "Healthy Living",
                            Icons.trending_up),
                        Container(
                          height: 40.h,
                          width: 1.w,
                          color: Colors.white,
                        ),
                        _trendCard(
                            "Goals Met", "17 of 22", Icons.directions_walk),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.h),

                  // Quick Links Section
                  _sectionHeader("Quick Links", "View More"),
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 10.w,
                    children: [
                      _quickLinkIcon(
                          "Health Questions", Icons.health_and_safety),
                      _quickLinkIcon("Reminders", Icons.notifications),
                      _quickLinkIcon("Routines", Icons.schedule),
                      _quickLinkIcon("Care Team", Icons.group),
                      _quickLinkIcon("Account Setup", Icons.settings),
                      _quickLinkIcon("Link Apps", Icons.link),
                      _quickLinkIcon("Calendar", Icons.calendar_today),
                      _quickLinkIcon("Other", Icons.more_horiz),
                    ],
                  ),

                  SizedBox(height: 10.h),

                  // Recommended Section
                  _sectionHeader("Recommended", "Explore Now"),
                  SizedBox(height: 15.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _recommendedCard(
                            "Healthy Eating", "Assets/Healthy_Item.jpeg"),
                        SizedBox(width: 10.w),
                        _recommendedCard(
                            "Mindfulness", "Assets/Mindfullness.jpg"),
                        SizedBox(width: 10.w),
                        _recommendedCard("Synch Apps", "Assets/Sync_App.jpg"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _trendCard(String title, String subtitle, IconData icon) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18.r,
          backgroundColor: Colors.white,
          child: Icon(
            icon,
            color: AppColors.purple,
            size: 18.sp,
          ),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14.sp, color: Colors.white),
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 12.sp, color: Colors.amber),
            ),
          ],
        ),
      ],
    );
  }

  Widget _sectionHeader(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              actionText,
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              size: 15.sp,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }

  Widget _quickLinkIcon(String title, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 26.r,
          backgroundColor: AppColors.purple,
          child: Icon(icon, size: 25.sp, color: Colors.white),
        ),
        SizedBox(height: 6.h),
        Flexible(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _recommendedCard(String title, String imagePath) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5.r,
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(imagePath, width: 80.w, height: 50.h, fit: BoxFit.cover),
          SizedBox(height: 8.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
