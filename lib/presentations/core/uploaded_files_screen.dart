import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/presentations/widgets/widgets.dart';

class UploadedFilesScreen<T> extends StatelessWidget {
  const UploadedFilesScreen({
    super.key,
    required this.groupedFiles,
    required this.getJson,
    this.transferredTitle,
  });

  final Map<String, List<T>> groupedFiles;
  final Map<String, dynamic> Function(T) getJson;
  final String? transferredTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.uploadedFiles,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.w),
        child: buildTransferFile(groupedFiles, context),
      ),
    );
  }

  Widget buildTransferFile(
      Map<String, List<T>> groupedFiles, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (groupedFiles['transfer']?.isNotEmpty ?? false) ...[
          buildsectionTitle(transferredTitle ?? "Files", context),
          buildFileGrid(
            groupedFiles['transfer']!.map(getJson).toList(),
            context,
          )
        ] else ...[
          buildsectionTitle(transferredTitle ?? "Files", context),
          noFilesAvailable(context),
        ],
        if (groupedFiles['receive']?.isNotEmpty ?? false) ...[
          buildsectionTitle(Strings.receivedMaterialFiles, context),
          buildFileGrid(
            groupedFiles['receive']!.map(getJson).toList(),
            context,
          )
        ]
      ],
    );
  }
}
