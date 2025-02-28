import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';

class AppSearchField extends StatefulWidget {
  const AppSearchField({
    super.key,
    required this.hintText,
    required this.onChange,
    this.suffixIcon,
  });
  final Widget? suffixIcon;
  final String hintText;
  final Function(String?) onChange;
  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  late Color primaryColor;
  final TextEditingController _searchController = TextEditingController();
  final _searchSubject = BehaviorSubject<String>();

  @override
  void dispose() {
    _searchController.dispose();
    _searchSubject.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _searchSubject
        .debounceTime(const Duration(milliseconds: 500))
        .skip(1)
        .listen((query) {
      log("query $query");
      widget.onChange(query);
    });

    _searchController.addListener(() {
      log("addListener");
      _searchSubject.add(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    primaryColor = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: widget.hintText,
          suffixIcon: widget.suffixIcon,
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(8.r),
          // ),
        ),
      ),
    );
  }
}
