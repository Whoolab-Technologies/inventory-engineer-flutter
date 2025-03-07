import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_shared_components/widgets/app_profile_pic_widget.dart';

class ProfilePicWidget extends StatelessWidget {
  const ProfilePicWidget({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: CircleAvatar(
        radius: 40.r,
        child: CircleAvatar(
          radius: 36.r,
          child: AppCachedImageWidget(
            imageUrl: imageUrl,
            imageProvider: const AssetImage("assets/images/profile.png"),
          ),
        ),
      ),
    );
  }
}
