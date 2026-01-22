import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/domain/models/transfer/item.dart';
import 'package:mvp_engineer/domain/models/transfer/transfer_file/transfer_file.dart';
import 'package:mvp_shared_components/core/extensions.dart';
import 'package:mvp_engineer/domain/models/transfer/note.dart';
import 'package:mvp_engineer/domain/models/transfer/transfer.dart';
import 'package:url_launcher/url_launcher.dart';

Widget _tag(String label, String? value) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(6.r),
    ),
    child: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "$label: ",
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          TextSpan(
            text: value ?? '-',
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.normal,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildTransferItemRow(Item item, BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 4.h),
    padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 8.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.w),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                item.productName ?? "",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            _tag("Material Id", item.catId),
            _tag("Cat", item.categoryName),
            _tag("Brand", item.brandName),
            _tag("Unit", item.unit),
          ],
        ),
        SizedBox(
          height: 4.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "${Strings.requested}: ",
                  style: TextStyle(
                    fontSize: 10.sp,
                  ),
                ),
                Text(
                  "${item.requestedQuantity ?? ""}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 4.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "${Strings.issued} : ",
                  style: TextStyle(
                    fontSize: 10.sp,
                  ),
                ),
                Text(
                  "${item.issuedQuantity ?? ""}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(children: [
              Text(
                "${Strings.received} : ",
                style: TextStyle(
                  fontSize: 10.sp,
                ),
              ),
              Text(
                "${item.receivedQuantity ?? ""}",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
          ],
        )
      ],
    ),
  );
}

Padding _buildTransactionNotesItem(BuildContext context, Note item) {
  return Padding(
    padding: EdgeInsets.all(8.w),
    child: Row(
      children: [
        Icon(
          Icons.note_alt_outlined,
          size: 16.sp,
          color: Theme.of(context).colorScheme.primary,
        ),
        SizedBox(
          width: 4.w,
        ),
        Expanded(
          child: Text(
            item.note ?? "",
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black87,
            ),
          ),
        )
      ],
    ),
  );
}

Container _buildsectionTitle(String title, BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 4.h),
    padding: EdgeInsets.all(4.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
    ),
    child: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _buildDetailsRow(String label, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4.h),
    child: Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    ),
  );
}

AlertDialog buildTranactionDetailsWidget(
    BuildContext context, Transfer transaction) {
  return AlertDialog(
    titleTextStyle: TextStyle(
      fontSize: 16.sp,
      color: Theme.of(context).colorScheme.primary,
      fontWeight: FontWeight.w600,
    ),
    title: const Text(
      Strings.transactionDetails,
    ),
    content: SizedBox(
      width: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDetailsRow("${Strings.mrNumber} :",
                transaction.materialRequest?.requestNumber ?? ""),
            _buildDetailsRow("Date :",
                transaction.createdAt?.toLocal().toDateString() ?? ""),
            _buildDetailsRow(
                "Time :",
                transaction.createdAt
                        ?.toLocal()
                        .toDateString(format: 'h:mm a') ??
                    ""),
            if ((transaction.notes ?? []).isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildsectionTitle(Strings.notes, context),
                  ...transaction.notes!
                      .map((item) => _buildTransactionNotesItem(context, item))
                ],
              ),
            _buildsectionTitle(Strings.items, context),
            ...(transaction.items ?? [])
                .map((item) => _buildTransferItemRow(item, context)),
            buildTransferFile(transaction.filesGroupedByType, context)
          ],
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          Strings.close,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 14.sp,
          ),
        ),
      ),
    ],
  );
}

Container buildsectionTitle(String title, BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 4.h),
    padding: EdgeInsets.all(4.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
    ),
    child: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

void _openFile(BuildContext context, String url) async {
  final uri = Uri.parse(url);
  try {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Could not open file')),
    );
  }
}

Widget buildFileGrid(List<Map<String, dynamic>> items, BuildContext context) {
  return GridView.builder(
    padding: EdgeInsets.symmetric(vertical: 8.w),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
    itemCount: items.length,
    itemBuilder: (context, index) {
      Map<String, dynamic> item = items[index];
      final fileUrl = item['url'] ?? '';
      final isImage = item['file_mime_type']?.startsWith('image/') ?? false;

      return GestureDetector(
        onTap: () => _openFile(context, fileUrl),
        child: Stack(
          children: [
            if (isImage)
              Image.network(
                fileUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              )
            else
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey[300],
                child: Icon(
                  Icons.insert_drive_file,
                  size: 40.w,
                  color: Colors.grey[700],
                ),
              ),
          ],
        ),
      );
    },
  );
}

Widget noFilesAvailable(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(16.w),
    child: Text(
      Strings.noFilesAvailable,
      style: TextStyle(
        fontSize: 14.sp,
        color: Theme.of(context).colorScheme.error,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget buildTransferFile(
  Map<String, List<TransferFile>> groupedFiles,
  BuildContext context,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      ...[
        buildsectionTitle(Strings.transferredMaterialFiles, context),
        (groupedFiles['transfer']?.isNotEmpty ?? false)
            ? buildFileGrid(
                groupedFiles['transfer']!.map((item) => item.toJson()).toList(),
                context,
              )
            : noFilesAvailable(context),
      ],
      ...[
        buildsectionTitle(Strings.receivedMaterialFiles, context),
        (groupedFiles['receive']?.isNotEmpty ?? false)
            ? buildFileGrid(
                groupedFiles['receive']!.map((item) => item.toJson()).toList(),
                context)
            : noFilesAvailable(context),
      ],
    ],
  );
}
