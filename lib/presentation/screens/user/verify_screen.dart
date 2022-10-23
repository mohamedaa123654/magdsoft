import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft/constants/app_constants.dart';
import 'package:magdsoft/constants/strings_manager.dart';
import 'package:magdsoft/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft/presentation/router/app_router.dart';
import 'package:magdsoft/presentation/screens/user/cubit/cubit.dart';
import 'package:magdsoft/presentation/screens/user/cubit/states.dart';
import 'package:magdsoft/presentation/view/otp_textField.dart';
import 'package:magdsoft/presentation/styles/color_manager.dart';
import 'package:magdsoft/presentation/styles/styles_manager.dart';
import 'package:magdsoft/presentation/widget/componant.dart';
import 'package:magdsoft/presentation/widget/toast.dart';
import 'package:sizer/sizer.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationStates>(
        listener: (context, state) {
      if (state is AuthenticationVerifyPhoneSuccessState) {
        if (state.account! != null) {
          showToast(
            text: 'Hello: ${state.account?.name}',
            state: ToastStates.SUCCESS,
          );
          Navigator.pushReplacementNamed(context, Routes.mainScreen);
          CacheHelper.saveDataSharedPreference(
            key: 'token',
            value: state.account?.id,
          ).then((value) {
            token = state.account?.id;
          });
        } else {
          showToast(
            text: 'لم يتم تسجيل الدخول',
            state: ToastStates.ERROR,
          );
        }
      }
    }, builder: (context, state) {
      AuthenticationCubit cubit = AuthenticationCubit.get(context);

      return state is AuthenticationVerifyPhoneLoadingState
          ? const Scaffold(body: Center(child: CircularProgressIndicator()))
          : Scaffold(
              body: SingleChildScrollView(
                child: Column(children: [
                  OTPFeilds(formKey: formKey),
                  ResendCodeTextButton(cubit: cubit),
                  VerifyButton(formKey: formKey)
                ]),
              ),
            );
    });
  }
}

//Resend otp again
class ResendCodeTextButton extends StatelessWidget {
  const ResendCodeTextButton({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final AuthenticationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return DefaultTextButton(
        function: () {
          showToast(
            text:
                '${cubit.loginResponse.message} OTP:${cubit.loginResponse.code}',
            state: ToastStates.SUCCESS,
          );
        },
        text: AppStrings.resendCode);
  }
}

///Verify Button to verify Phone number and navigate to home Screen
class VerifyButton extends StatelessWidget {
  const VerifyButton({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: DefaultButton(
          padding: 10.w,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              AuthenticationCubit.get(context)
                  .verifyPhone(code: otp, phone: phone);
            }
          },
          text: AppStrings.verify),
    );
  }
}

///feilds to but otp code
class OTPFeilds extends StatelessWidget {
  const OTPFeilds({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 45.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorManager.primary.withOpacity(0.85),
              ColorManager.primary.withOpacity(0),
            ]),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 6.7.h),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.verifyPhone,
                  style: getRegularStyle(
                      color: ColorManager.white, fontSize: 24.sp),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.h, left: 11.w, right: 11.w),
                  child: SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OTPTextField(onChange: (value) {
                          if (value!.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        }, onSaved: (value) {
                          otp = otp.replaceRange(0, null, value!);
                        }),
                        OTPTextField(onChange: (value) {
                          if (value!.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        }, onSaved: (value) {
                          otp = otp.replaceRange(1, null, value!);
                        }),
                        OTPTextField(onChange: (value) {
                          if (value!.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        }, onSaved: (value) {
                          otp = otp.replaceRange(2, null, value!);
                        }),
                        OTPTextField(onChange: (value) {
                          if (value!.length == 1) {
                            // FocusScope.of(context).nextFocus();
                          }
                        }, onSaved: (value) {
                          otp = otp.replaceRange(3, null, value!);
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
