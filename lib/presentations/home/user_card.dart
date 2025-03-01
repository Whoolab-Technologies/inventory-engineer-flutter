import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/domain/app-data/app_data.dart';
import 'package:mvp_engineer/domain/auth/model/user/user.dart';
import 'package:mvp_engineer/presentations/home/profile_pic_widget.dart';
import 'package:mvp_engineer/presentations/profile/profile_screen.dart';

class UserCard extends StatelessWidget {
  final Color primaryColor;
  final User? user;
  const UserCard({super.key, required this.user, required this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, ${AppData.engineer?.name ?? ""}!',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
                Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            Material(
              elevation: 12,
              borderRadius: BorderRadius.circular(100.r),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const ProfileScreen(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(50.r),
                child: ProfilePicWidget(imageUrl: user!.imageUrl ?? ""),
              ),
            )
          ],
        ),
      ),
    );
  }
}
