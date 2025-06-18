import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvp_engineer/application/material_return/material_return_bloc.dart';
import 'package:mvp_engineer/core/values/strings.dart';
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
      body: Column(children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              // context.read<MaterialRequestBloc>().add(
              //       const MaterialRequestEvent.fetchMaterialRequests(),
              //     );
            },
            child: SizedBox.expand(
              child: SingleChildScrollView(
                child: BlocConsumer<MaterialReturnBloc, MaterialReturnState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Container();
                    }),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
