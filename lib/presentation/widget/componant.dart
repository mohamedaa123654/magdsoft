import 'package:flutter/material.dart';
import 'package:magdsoft/presentation/styles/color_manager.dart';
import 'package:sizer/sizer.dart';

//General Button For App
class DefaultButton extends StatelessWidget {
  VoidCallback? onPressed;
  String text;
  double? textSize;
  double? padding;
  double radius;
  double width;
  bool isUpperCase;
  Color? buttonColor;
  Color? textColor;

  DefaultButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.width = double.infinity,
      this.padding,
      this.radius = 30.0,
      this.isUpperCase = false,
      this.buttonColor = ColorManager.primary,
      this.textColor = ColorManager.white,
      this.textSize = 14})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
      child: Container(
        width: width,
        height: 5.5.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                ColorManager.primary.withOpacity(1),
                ColorManager.primary.withOpacity(0.5),
                ColorManager.primary.withOpacity(0.27),
              ]),
          borderRadius: BorderRadius.circular(
            radius,
          ),
          color: buttonColor,
        ),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(color: textColor, fontSize: textSize),
          ),
        ),
      ),
    );
  }
}

//General TextButton For App
class DefaultTextButton extends StatelessWidget {
  VoidCallback? function;
  String text;
  DefaultTextButton({Key? key, required this.function, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: ColorManager.primary, fontSize: 16.sp),
      ),
    );
  }
}
//General Text FormFeils For App

class DefaultTextFormFeild extends StatelessWidget {
  TextEditingController? controller;
  TextInputType? type;
  ValueChanged<String>? onSubmit;
  ValueChanged<String>? onChange;
  GestureTapCallback? onTap;
  bool isPassword = false;
  FormFieldValidator<String>? validate;
  String hint;
  double width;
  IconData? prefix;
  IconData? suffix;
  VoidCallback? suffixPressed;
  bool isClickable = true;

  DefaultTextFormFeild({
    this.controller,
    this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.isPassword = false,
    this.validate,
    this.width = 65.58,
    required this.hint,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.isClickable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: width.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: isPassword,
          enabled: isClickable,
          onFieldSubmitted: onSubmit,
          onChanged: onChange,
          onTap: onTap,
          validator: validate,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            // prefixIcon: Icon(prefix),
            suffixIcon: Icon(
              suffix,
              size: 24.sp,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            filled: true,
            fillColor: ColorManager.white,
            hintStyle: TextStyle(color: ColorManager.grey, fontSize: 10.sp),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
