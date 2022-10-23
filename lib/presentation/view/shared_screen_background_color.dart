import 'package:flutter/material.dart';
import 'package:magdsoft/presentation/styles/color_manager.dart';
import 'package:sizer/sizer.dart';

class SharedScreenBackgroundColor extends StatelessWidget {
  SharedScreenBackgroundColor({required this.child});
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorManager.primary.withOpacity(0.85),
                ColorManager.primary.withOpacity(0),
                ColorManager.primary.withOpacity(0),
              ]),
        ),
        child: child);
  }
}
