import 'package:flutter/material.dart';
import 'package:magdsoft/presentation/styles/color_manager.dart';
import 'package:sizer/sizer.dart';

class CustomExpansionTile extends StatelessWidget {
  String answer;
  String question;

  CustomExpansionTile({required this.answer, required this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.7.w),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(2, 2), // changes position of shadow
          ),
        ], borderRadius: BorderRadius.circular(10), color: ColorManager.white),
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ExpansionTile(
              title: Text(
                question,
                style: TextStyle(color: ColorManager.primary),
              ),
              backgroundColor: ColorManager.white,
              collapsedIconColor: ColorManager.black,
              iconColor: ColorManager.black,
              children: [
                ListTile(
                    title: Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: Text(
                    answer,
                    maxLines: 5,
                  ),
                )),
              ]),
        ),
      ),
    );
  }
}
