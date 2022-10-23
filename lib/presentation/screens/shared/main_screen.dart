import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft/presentation/screens/shared/cubit/cubit.dart';
import 'package:magdsoft/presentation/screens/shared/cubit/states.dart';
import 'package:magdsoft/presentation/screens/shared/home_screen.dart';
import 'package:magdsoft/presentation/view/diamond_bottom_navigation.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            bottomNavigationBar: DiamondBottomNavigation(
              itemIcons: cubit.bIcons,
              selectedIndex: cubit.index,
              onItemPressed: (value) {
                cubit.updateScreen(value);
              },
            ),
            body: HomeScreen(),
          );
        });
  }
}
