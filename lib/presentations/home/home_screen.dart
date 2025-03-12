import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/home/home_bloc.dart';
import 'package:mvp_engineer/application/material_request/material_request_bloc.dart';
import 'package:mvp_engineer/application/products/products_bloc.dart';
import 'package:mvp_engineer/application/transfer/transfer_bloc.dart';
import 'package:mvp_engineer/core/routes/routes.dart';
import 'package:mvp_engineer/core/utils/utils.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/domain/models/home/home_data.dart';
import 'package:mvp_engineer/presentations/home/home_card.dart';
import 'package:mvp_engineer/presentations/home/loading-skeletons/home_loading_widget.dart';
import 'package:mvp_engineer/presentations/home/product_card.dart';
import 'package:mvp_engineer/presentations/home/recent_request_item.dart';
import 'package:mvp_engineer/presentations/home/user_card.dart';
import 'package:mvp_engineer/presentations/scanner/qr_code_scanner_page.dart';
import 'package:mvp_shared_components/widgets/no_data_available_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(const HomeEvent.fetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<HomeBloc>().add(const HomeEvent.fetchData());
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(8.w),
            child: BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {
                state.homeDataFailuresOrSuccess.fold(
                    () => null,
                    (ifSome) => ifSome.fold((l) {
                          String message =
                              l.map(customError: (error) => error.message);
                          Utils.handleError(context, message);
                        }, (_) => null));
              },
              builder: (context, state) {
                if (state.isloading) {
                  return const HomeLoadingWidget();
                }
                return state.homeDataFailuresOrSuccess.fold(
                  () => const SizedBox.shrink(),
                  (some) => some.fold(
                    (l) {
                      return const SizedBox.shrink();
                    },
                    (data) {
                      return Column(
                        children: [
                          UserCard(user: data.user, primaryColor: primaryColor),
                          SizedBox(height: 16.h),
                          OutofStockProducts(
                              data: data, primaryColor: primaryColor),
                          SizedBox(height: 16.h),
                          RecentMaterialRequest(
                              data: data, primaryColor: primaryColor),
                          SizedBox(height: 16.h),
                          GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.w,
                            mainAxisSpacing: 16.h,
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
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.PRODUCTS);
                                },
                              ),
                              HomeCard(
                                icon: Icons.qr_code_scanner_outlined,
                                label: 'Scan Items',
                                primaryColor: primaryColor,
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                      return const QRCodeScannerPage();
                                    }),
                                  );
                                },
                              ),
                              HomeCard(
                                icon: Icons.menu_open_outlined,
                                label: 'Requests',
                                primaryColor: primaryColor,
                                onTap: () {
                                  context.read<MaterialRequestBloc>().add(
                                      const MaterialRequestEvent
                                          .fetchMaterialRequests());
                                  Navigator.of(context).pushNamed(AppRoutes.MR);
                                },
                              ),
                              HomeCard(
                                icon: Icons.transfer_within_a_station_outlined,
                                label: 'Inventory Transfer',
                                primaryColor: primaryColor,
                                onTap: () {
                                  context.read<TransferBloc>().add(
                                        const TransferEvent.getTransfers(),
                                      );
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.TRANSFERS);
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          // ...existing code...
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class OutofStockProducts extends StatelessWidget {
  const OutofStockProducts({
    super.key,
    required this.primaryColor,
    required this.data,
  });

  final Color primaryColor;
  final HomeData data;
  @override
  Widget build(BuildContext context) {
    final products = (data.outOfStockProducts ?? []);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Out of Stock',
            style: TextStyle(
              fontSize: 18.sp,
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 160.h,
          child: (products.isEmpty)
              ? const NoDataAvailableCard(
                  message: Strings.noOutOfStockProducts,
                )
              : ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 8.w,
                    );
                  },
                  itemBuilder: (context, index) {
                    final product = data.outOfStockProducts![index];
                    return ProductCard(product: product);
                  },
                ),
        ),
      ],
    );
  }
}

class RecentMaterialRequest extends StatelessWidget {
  const RecentMaterialRequest({
    super.key,
    required this.primaryColor,
    required this.data,
  });

  final Color primaryColor;
  final HomeData data;
  @override
  Widget build(BuildContext context) {
    final requests = (data.materialRequests ?? []);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
        SizedBox(height: 8.h),
        SizedBox(
          height: 120.h,
          child: (requests.isEmpty)
              ? const NoDataAvailableCard(
                  message: Strings.noRequestApproved,
                )
              : ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: requests.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 16.w,
                    );
                  },
                  itemBuilder: (context, index) {
                    final materialRequest = data.materialRequests![index];
                    return RecentRequestItem(materialRequest: materialRequest);
                  },
                ),
        ),
      ],
    );
  }
}
