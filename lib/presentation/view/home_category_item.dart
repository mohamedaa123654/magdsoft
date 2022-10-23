import 'package:flutter/material.dart';
import 'package:magdsoft/constants/assets_manager.dart';
import 'package:magdsoft/presentation/styles/color_manager.dart';
import 'package:sizer/sizer.dart';

class CategoryItem extends StatelessWidget {
  String image;
  String name;
  Color bgColor;

  CategoryItem({required this.image, required this.name,this.bgColor=ColorManager.white});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 6.w),
          child: Container(
              height: 5.6.h,
              width: 30.w,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 8,
                      spreadRadius: 4,
                      offset: const Offset(2, 2), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                  color: bgColor),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Container(
                      height: 4.6.h,
                      width: 4.6.h,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          blurRadius: 6,
                          offset:
                              const Offset(2, 2), // changes position of shadow
                        ),
                      ], shape: BoxShape.circle, color: ColorManager.white),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.asset(image),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    name,
                    style: TextStyle(fontSize: 16.sp),
                  )),
                ],
              )),
        ),
      ],
    );
  }
}
