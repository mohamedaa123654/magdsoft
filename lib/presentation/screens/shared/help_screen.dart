import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft/constants/strings_manager.dart';
import 'package:magdsoft/presentation/router/app_router.dart';
import 'package:magdsoft/presentation/screens/shared/cubit/cubit.dart';
import 'package:magdsoft/presentation/screens/shared/cubit/states.dart';
import 'package:magdsoft/presentation/styles/color_manager.dart';
import 'package:magdsoft/presentation/styles/styles_manager.dart';
import 'package:magdsoft/presentation/view/help_screen_custom_expansion_tile.dart';
import 'package:magdsoft/presentation/view/shared_screen_background_color.dart';
import 'package:magdsoft/presentation/widget/componant.dart';
import 'package:sizer/sizer.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Scaffold(
          body: BackgroundColor(cubit: cubit),
        );
      },
    );
  }
}

class BackgroundColor extends StatelessWidget {
  const BackgroundColor({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SharedScreenBackgroundColor(
      child: HelpsBody(cubit: cubit),
    );
  }
}

///Contain ExpansionTile ListView and button Navigate to Main Screen
class HelpsBody extends StatelessWidget {
  const HelpsBody({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.7.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.help,
                style:
                    getRegularStyle(color: ColorManager.white, fontSize: 24.sp),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cubit.help.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: 2.7.h,
                  ),
                  child: CustomExpansionTile(
                      answer: cubit.help[index].answer,
                      question: cubit.help[index].question),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 2.5.h),
            child: DefaultButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.mainScreen);
                  HomeCubit.get(context).updateScreen(0);
                },
                text: AppStrings.continue_),
          )
        ],
      ),
    );
  }
}
