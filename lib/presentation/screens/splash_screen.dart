import 'dart:async';
import 'package:flutter/material.dart';
import 'package:magdsoft/constants/app_constants.dart';
import 'package:magdsoft/constants/assets_manager.dart';
import 'package:magdsoft/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft/presentation/router/app_router.dart';
import 'package:magdsoft/presentation/styles/color_manager.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  var token = CacheHelper.getDataFromSharedPreference(key: 'token');

  _startDelay() {
    _timer = Timer(const Duration(seconds: splashDelay), _goNext);
  }

  _goNext() async {
    if (token!=null) {
      // navigate to main screen
      // Navigator.pushReplacementNamed(context, Routes.mainRoute);
      Navigator.pushReplacementNamed(context, Routes.mainScreen);
    } else {
      // navigate to Login screen
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(color: ColorManager.primary),
        child: Image.asset(ImageAssets.splash,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
