import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/material_request/material_request_bloc.dart';
import 'package:mvp_engineer/application/products/products_bloc.dart';
import 'package:mvp_engineer/core/routes/routes.dart';
import 'package:mvp_engineer/domain/app-data/app_data.dart';
import 'package:mvp_engineer/presentations/material_requests/material_request_screen.dart';
import 'package:mvp_engineer/presentations/profile/profile_screen.dart';
import 'package:mvp_engineer/presentations/widgets/app_profile_pic_widget.dart';
// import 'package:mvp_engineer/presentation/scanner/qr_code_scanner.dart';
// import 'package:mvp_engineer/presentation/scanner/qr_view.dart';
//import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  // static final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Column(
              children: [
                UserCard(primaryColor: primaryColor),
                SizedBox(height: 16.0.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recent Requests',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8.0.h),
                SizedBox(
                  height: 160.0.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 8.w,
                      );
                    },
                    itemBuilder: (context, index) {
                      return ProductCard(
                          index: index, primaryColor: primaryColor);
                    },
                  ),
                ),
                SizedBox(height: 16.0.h),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0.w,
                  mainAxisSpacing: 16.0.h,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    HomeCard(
                      icon: Icons.inventory_2_outlined,
                      label: 'Products',
                      primaryColor: primaryColor,
                      onTap: () {
                        context
                            .read<ProductsBloc>()
                            .add(const ProductsEvent.getProducts());
                        Navigator.of(context).pushNamed(AppRoutes.PRODUCTS);
                      },
                    ),
                    HomeCard(
                      icon: Icons.qr_code_scanner_outlined,
                      label: 'Scan Items',
                      primaryColor: primaryColor,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const MaterialRequestScreen();
                            },
                          ),
                        );
                      },
                    ),
                    HomeCard(
                      icon: Icons.menu_open_outlined,
                      label: 'Requests',
                      primaryColor: primaryColor,
                      onTap: () {
                        context.read<MaterialRequestBloc>().add(
                            const MaterialRequestEvent.fetchMaterialRequests());
                        Navigator.of(context).pushNamed(AppRoutes.MR);
                      },
                    ),
                    HomeCard(
                      icon: Icons.transfer_within_a_station_outlined,
                      label: 'Inventory Transfer',
                      primaryColor: primaryColor,
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.TRANSACTIONS);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16.0.h),
                // ...existing code...
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final Color primaryColor;

  const UserCard({super.key, required this.primaryColor});

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
                child: const ProfilePicWidget(
                  imageUrl:
                      'https://dentalia.orionthemes.com/demo-1/wp-content/uploads/2016/10/dentalia-demo-deoctor-3-1-750x750.jpg',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

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

class ProductCard extends StatelessWidget {
  final int index;
  final Color primaryColor;

  const ProductCard(
      {super.key, required this.index, required this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8.0.w),
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0.w),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(2, 1.5),
              ),
            ],
          ),
          child: SizedBox(
            width: 120.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 100.h,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, size: 50),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Text(
                    'Product ${index + 1}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
