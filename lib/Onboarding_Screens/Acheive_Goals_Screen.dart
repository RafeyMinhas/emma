import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AcheiveGoals extends StatelessWidget {
  const AcheiveGoals({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Acheive Goals",
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
                "Assets/EH_Phone_and_Fruit.png", // Replace with your image path
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
