import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft/constants/app_constants.dart';
import 'package:magdsoft/constants/assets_manager.dart';
import 'package:magdsoft/constants/strings_manager.dart';
import 'package:magdsoft/presentation/router/app_router.dart';
import 'package:magdsoft/presentation/screens/user/cubit/cubit.dart';
import 'package:magdsoft/presentation/screens/user/cubit/states.dart';
import 'package:magdsoft/presentation/styles/color_manager.dart';
import 'package:magdsoft/presentation/styles/styles_manager.dart';
import 'package:magdsoft/presentation/widget/componant.dart';
import 'package:magdsoft/presentation/widget/toast.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return BlocConsumer<AuthenticationCubit, AuthenticationStates>(
        listener: (context, state) {
      if (state is AuthenticationCreateAccountSuccessState) {
        if (state.loginResponse!.status == 200) {
          showToast(
            text:
                '${state.loginResponse?.message} OTP:${state.loginResponse?.code}',
            state: ToastStates.SUCCESS,
          );
          Navigator.pushReplacementNamed(context, Routes.verifyScreen);
        } else {
          showToast(
            text: state.loginResponse?.message ?? 'لم يتم تسجيل الدخول',
            state: ToastStates.ERROR,
          );
        }
      }
    }, builder: (context, state) {
      return state is AuthenticationCreateAccountLoadingState
          ? const Scaffold(body: Center(child: CircularProgressIndicator()))
          : Scaffold(
              body: Stack(
              children: [
                ///BG Image and auth Button facebook,google
                Positioned(
                  top: 0,
                  child: SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0.h,
                          child: Container(
                            height: 42.h,
                            width: 100.w,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    ImageAssets.loginBG,
                                  )),
                            ),
                            child: Container(
                                height: 42.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    color: ColorManager.primary
                                        .withOpacity(0.32))),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: 100.w,
                            height: 66.h,
                            decoration: const BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50))),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 18.h, bottom: 10.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 39.w,
                                          height: 0.2.h,
                                          decoration: BoxDecoration(
                                              color: ColorManager.primary
                                                  .withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(AppStrings.or,
                                              style: getRegularStyle(
                                                fontSize: 18,
                                                color: ColorManager.primary
                                                    .withOpacity(0.6),
                                              )),
                                        ),
                                        Container(
                                          width: 39.w,
                                          height: 0.2.h,
                                          decoration: BoxDecoration(
                                              color: ColorManager.primary
                                                  .withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 12.w,
                                          height: 12.w,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.25),
                                                  blurRadius: 20,
                                                  spreadRadius: 5,
                                                  offset: const Offset(2, 5),
                                                ),
                                              ],
                                              color: ColorManager.white,
                                              shape: BoxShape.circle),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              ImageAssets.facebookLogo,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 12.w,
                                          height: 12.w,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.25),
                                                  blurRadius: 20,
                                                  spreadRadius: 5,
                                                  offset: const Offset(2, 5),
                                                ),
                                              ],
                                              color: ColorManager.white,
                                              shape: BoxShape.circle),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              ImageAssets.iosLogo,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 12.w,
                                          height: 12.w,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.25),
                                                  blurRadius: 20,
                                                  spreadRadius: 5,
                                                  offset: const Offset(2, 5),
                                                ),
                                              ],
                                              color: ColorManager.white,
                                              shape: BoxShape.circle),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              ImageAssets.googleLogo,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                ///Login Form
                Positioned(
                  top: 20.h,
                  right: 3.h,
                  left: 3.h,
                  child: Container(
                    width: 100.w,
                    height: 37.h,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IntrinsicWidth(
                            child: Column(
                              children: [
                                Text(
                                  AppStrings.welcome,
                                  style: getRegularStyle(
                                      color: ColorManager.text,
                                      fontSize: 24.sp),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 1.h),
                                  child: Container(
                                    height: 3.5.sp,
                                    color:
                                        ColorManager.primary.withOpacity(0.72),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DefaultTextFormFeild(
                            controller: nameController,
                            type: TextInputType.text,
                            hint: AppStrings.enterYourFullName,
                            validate: (name) {
                              if (name!.length < 5) {
                                return AppStrings.invalidName;
                              } else {
                                return null;
                              }
                            },
                          ),
                          DefaultTextFormFeild(
                            controller: phoneController,
                            type: TextInputType.phone,
                            hint: AppStrings.enterYourPhoneNumber,
                            validate: (phone) {
                              if (phone!.length < 11) {
                                return AppStrings.invalidPhone;
                              } else {
                                return null;
                              }
                            },
                          ),
                          DefaultButton(
                              width: 65.58.w,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  phone = phoneController.text;
                                  AuthenticationCubit.get(context)
                                      .createAccount(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                  );
                                }
                              },
                              text: AppStrings.login),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
    });
  }
}
