import 'package:emma_ui_project/Custom_Widgets/Activity_Card.dart';
import 'package:emma_ui_project/Utils/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutYouScreen extends StatelessWidget {
  const AboutYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dailyPlanCard(),
        SizedBox(height: 20.h),
        _recommendationCard(),
      ],
    );
  }

  Widget _dailyPlanCard() {
    return Container(
      width: 320.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.deepPurple[100],
        borderRadius: BorderRadius.circular(12.r),
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
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[900],
                ),
              ),
              Icon(Icons.more_vert, size: 20.sp, color: Colors.deepPurple[900]),
            ],
          ),
          SizedBox(height: 10.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _planItem('8:30 am: Meds', Colors.black),
              _planItem('12:30 pm: Lunch', Colors.black),
              _planItem('6:30 pm: Walk', Colors.red),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.calendar_today,
                  size: 20.sp, color: Colors.deepPurple[800]),
              SizedBox(width: 5.w),
              Text(
                'View Calendar',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[800],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _recommendationCard() {
    return Container(
      width: 320.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.deepPurple[100],
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
                  Icon(Icons.notifications,
                      size: 20.sp, color: Colors.deepPurple[900]),
                  SizedBox(width: 5.w),
                  Text(
                    'Recommendation',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[900],
                    ),
                  ),
                ],
              ),
              Icon(Icons.more_vert, size: 20.sp, color: Colors.deepPurple[900]),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            'Mindfulness Tips',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple[900],
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Colors.deepPurple[200],
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Container(
                  width: 70.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.white,
                  ),
                  child:
                      Icon(Icons.image, size: 30.sp, color: Colors.deepPurple),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Midful.org',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple[700],
                      ),
                    ),
                    Text(
                      'How to Meditate with Anxiety',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.deepPurple[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// ignore: unused_element
  Widget _planItem(String text, Color textColor) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          color: textColor,
        ),
      ),
    );
  }
}
/*
class ResponsiveCard extends StatelessWidget {
  const ResponsiveCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dailyPlanCard(),
        SizedBox(height: 20.h),
        _recommendationCard(),
      ],
    );
  }

  Widget _dailyPlanCard() {
    return Container(
      width: 320.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.deepPurple[100],
        borderRadius: BorderRadius.circular(12.r),
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
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[900],
                ),
              ),
              Icon(Icons.more_vert, size: 20.sp, color: Colors.deepPurple[900]),
            ],
          ),
          SizedBox(height: 10.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _planItem('8:30 am: Meds', Colors.black),
              _planItem('12:30 pm: Lunch', Colors.black),
              _planItem('6:30 pm: Walk', Colors.red),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.calendar_today, size: 20.sp, color: Colors.deepPurple[800]),
              SizedBox(width: 5.w),
              Text(
                'View Calendar',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[800],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _recommendationCard() {
    return Container(
      width: 320.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.deepPurple[100],
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
                  Icon(Icons.notifications, size: 20.sp, color: Colors.deepPurple[900]),
                  SizedBox(width: 5.w),
                  Text(
                    'Recommendation',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple[900],
                    ),
                  ),
                ],
              ),
              Icon(Icons.more_vert, size: 20.sp, color: Colors.deepPurple[900]),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            'Mindfulness Tips',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple[900],
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Colors.deepPurple[200],
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Container(
                  width: 70.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.white,
                  ),
                  child: Icon(Icons.image, size: 30.sp, color: Colors.deepPurple),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Midful.org',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple[700],
                      ),
                    ),
                    Text(
                      'How to Meditate with Anxiety',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.deepPurple[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _planItem(String text, Color textColor) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          color: textColor,
        ),
      ),
    );
  }
}
 */

