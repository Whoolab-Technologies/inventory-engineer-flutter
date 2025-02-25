import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/auth/auth_bloc.dart';
import 'package:mvp_engineer/core/routes/routes.dart';
import 'package:mvp_engineer/domain/app-data/app_data.dart';
import 'package:mvp_engineer/presentations/widgets/app_profile_pic_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Spacer(),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: AppCachedImageWidget(
                            imageUrl: AppData.engineer!.imageUrl ?? "",
                            imageProvider:
                                const AssetImage("assets/images/profile.png"),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 10,
                          child: IconButtonTheme(
                            data: IconButtonThemeData(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                    Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer),
                              ),
                            ),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.edit_outlined,
                                  size: 30,
                                  color: Theme.of(context).colorScheme.primary,
                                )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      AppData.engineer!.name,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Engineer",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      AppData.engineer!.email ?? "",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ),
                    const Spacer()
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Edit',
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(const AuthEvent.signedOut());
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          AppRoutes.LOGIN, (_) => false);
                    },
                    child: const Text(
                      'Logout',
                    ),
                  ),
                  const Spacer(),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
