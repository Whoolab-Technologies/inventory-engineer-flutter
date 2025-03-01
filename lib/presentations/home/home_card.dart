import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color primaryColor;
  final VoidCallback onTap;

  const HomeCard({
    super.key,
    required this.icon,
    required this.label,
    required this.primaryColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.0.w),
      child: Container(
        margin: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0.w),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40.sp, color: primaryColor),
            SizedBox(height: 8.0.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
