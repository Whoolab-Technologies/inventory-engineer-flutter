import 'package:flutter/material.dart';
import 'package:mvp_engineer/core/values/strings.dart';

class MaterialReturnCreateScreen extends StatelessWidget {
  const MaterialReturnCreateScreen({super.key});

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
      ),
      body: Column(children: []),
    );
  }
}
