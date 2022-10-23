import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magdsoft/presentation/styles/color_manager.dart';
import 'package:sizer/sizer.dart';

class OTPTextField extends StatelessWidget {
  Function(String?)? onSaved;
  Function(String?)? onChange;

  OTPTextField({required this.onChange, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 18.6.w,
        width: 16.w,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              blurRadius: 10,
              offset: const Offset(5, 2), // changes position of shadow
            ),
          ],
        ),
        child: TextFormField(
            style: Theme.of(context).textTheme.headline6,
            keyboardType: TextInputType.number,
            onSaved: onSaved,
            onChanged: onChange,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorManager.white,
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
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ]));
  }
}
