import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/material_return/material_return_bloc.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/presentations/material_return/material_return_card.dart';
import 'package:mvp_engineer/presentations/material_return/material_return_create_screen.dart';

class MaterialReturnScreen extends StatefulWidget {
  const MaterialReturnScreen({super.key});

  @override
  State<MaterialReturnScreen> createState() => _MaterialReturnScreenState();
}

class _MaterialReturnScreenState extends State<MaterialReturnScreen> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.materialReturn,
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<MaterialReturnBloc>().add(
                    const MaterialReturnEvent.getProductsList(),
                  );
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MaterialReturnCreateScreen(),
              ));
            },
            icon: const Icon(
              Icons.add_circle_outline,
            ),
          )
        ],
      ),
      body: BlocBuilder<MaterialReturnBloc, MaterialReturnState>(
        buildWhen: (previous, current) =>
            previous.materialReturnListFailureOrsuccess !=
            current.materialReturnListFailureOrsuccess,
        builder: (context, state) {
          return Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async {
                  context.read<MaterialReturnBloc>().add(
                        const MaterialReturnEvent.getMaterialReturnList(),
                      );
                },
                child: state.materialReturnListFailureOrsuccess.fold(
                  () => ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: 200.h),
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                  (either) => either.fold(
                    // Show failure
                    (failure) => ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        SizedBox(height: 200.h),
                        Center(
                          child: Text(
                            failure.map(customError: (error) => error.message),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.red[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Show list or empty message
                    (items) {
                      if (items.isEmpty) {
                        return ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            SizedBox(height: 200.h),
                            Center(
                              child: Text(
                                "No data found.",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return ListView.separated(
                        padding: const EdgeInsets.only(bottom: 16),
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, i) {
                          final materialReturn = items[i];
                          return MaterialReturnCard(
                              materialReturn: materialReturn);
                        },
                        separatorBuilder: (context, i) =>
                            const SizedBox(height: 4),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );

    //   body: Column(children: [
    //     Expanded(
    //       child: RefreshIndicator(
    //         onRefresh: () async {
    //           // context.read<MaterialRequestBloc>().add(
    //           //       const MaterialRequestEvent.fetchMaterialRequests(),
    //           //     );
    //         },
    //         child: SizedBox.expand(
    //           child: SingleChildScrollView(
    //             child: BlocConsumer<MaterialReturnBloc, MaterialReturnState>(
    //                 listener: (context, state) {},
    //                 builder: (context, state) {
    //                   return Container();
    //                 }),
    //           ),
    //         ),
    //       ),
    //     )
    //   ]),
    // );
  }
}
