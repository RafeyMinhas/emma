import 'package:emma_ui_project/Other_Screens/Calender_Screen.dart';
import 'package:emma_ui_project/Utils/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutYouScreen extends StatefulWidget {
  const AboutYouScreen({Key? key}) : super(key: key);

  @override
  _AboutYouScreenState createState() => _AboutYouScreenState();
}

class _AboutYouScreenState extends State<AboutYouScreen> {
  // Define the data for daily plan items with text and colors
  List<Map<String, dynamic>> planItems = [
    {'time': '8:30 am: Meds', 'color': Colors.blue[900]},
    {'time': '12:30 pm: Lunch', 'color': AppColors.purple},
    {'time': '6:30 pm: Walk', 'color': Colors.red},
  ];

  // Scroll up
  void _scrollUp() {
    setState(() {
      // Rotate the list upwards
      planItems.insert(0, planItems.removeLast());
    });
  }

  // Scroll down
  void _scrollDown() {
    setState(() {
      // Rotate the list downwards
      planItems.add(planItems.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "About You",
                style: TextStyle(
                  color: const Color(0xFFFFC107),
                  fontSize: 35.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5.h),
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
                    Padding(
                      padding: EdgeInsets.only(left: 50.w),
                      child: Text(
                        "Hi, Claudia",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xFFFFD700),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.only(right: 160.w),
                  child: Container(
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    _dailyPlanCard(),
                    SizedBox(height: 10.h),
                    _recommendationCard(),
                    SizedBox(height: 10.h),
                    _profileSettingCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dailyPlanCard() {
    return Container(
      width: 320.w, // Reduced width
      padding: EdgeInsets.all(10.w), // Reduced padding
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 178, 161, 211),
        borderRadius:
            BorderRadius.circular(10.r), // Slightly reduced border radius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Daily Plan',
                style: TextStyle(
                  fontSize: 20.sp, // Reduced font size
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[500],
                ),
              ),
              Icon(
                Icons.more_horiz,
                size: 40.sp, // Reduced icon size
                color: Colors.brown[500],
              ),
            ],
          ),
          // Reduced spacing

          // Scrollable column for plan items
          Row(
            children: [
              // Up Arrow
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_up_rounded),
                    onPressed: _scrollUp,
                    iconSize: 30.sp,
                    color: Colors.white, // Adjusted the size of the arrow
                  ),
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    onPressed: _scrollDown,
                    iconSize: 30.sp,
                    color: Colors.white, // Adjusted the size of the arrow
                  ),
                ],
              ),

              // Scrollable Text Section (Vertical)
              Column(
                children: planItems.map((item) {
                  return _planItem(
                      item['time'], item['color'], 18.sp, FontWeight.bold);
                }).toList(),
              ),
            ],
          ),
          SizedBox(height: 8.h), // Reduced spacing
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarScreen()),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.calendar_today,
                    size: 18.sp, // Reduced icon size
                    color: Colors.deepPurple[800]),
                SizedBox(width: 5.w),
                Text(
                  'View Calendar',
                  style: TextStyle(
                    fontSize: 12.sp, // Reduced font size
                    fontWeight: FontWeight.bold,
                    color: AppColors.purple,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _planItem(
      String text, Color textColor, double fontSize, FontWeight fontWeight) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h), // Reduced bottom margin
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize, // Custom font size
          fontWeight: fontWeight, // Custom font weight
          color: textColor, // Custom text color
        ),
      ),
    );
  }

  Widget _recommendationCard() {
    return Container(
      width: 320.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 178, 161, 211),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.notifications,
                    size: 30.sp,
                    color: Colors.brown[500],
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    'Recommendation',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[500],
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.more_horiz,
                size: 40.sp, // Reduced icon size
                color: Colors.brown[500],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            'Mindfulness Tips',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.brown[500],
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 199, 192, 212),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Midful.org',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    Text(
                      'How to Meditate with Anxiety',
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(width: 30.w),
                Container(
                  width: 70.w, // Adjust width
                  height: 50.h, // Adjust height
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("Assets/Video_Pic.png"), // Local image
                      fit: BoxFit
                          .cover, // How the image should fit the container
                    ),
                    // Optional: Rounded corners
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileSettingCard() {
    return Container(
      width: 320.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 178, 161, 211),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Title and Menu Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 40.sp,
                    color: Colors.brown[500],
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    'Profile Settings',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[500],
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.more_horiz,
                size: 40.sp, // Reduced icon size
                color: Colors.brown[500],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          // Alerts and Setup Needed Section
          Row(
            children: [
              Icon(
                Icons.notifications,
                size: 20.sp,
                color: Colors.brown[500],
              ),
              SizedBox(width: 5.w),
              Text(
                '2 Alerts',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.brown[500],
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          // Setup Needed with Progress Indicator
          Row(
            children: [
              CircularProgressIndicator(
                value: 0.70, // Progress: 55%
                color: Colors.deepPurple[900],
                backgroundColor: Colors.brown[300],
                strokeWidth: 2.w,
              ),
              SizedBox(width: 10.w),
              Text(
                'Setup Needed',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.brown[500],
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
