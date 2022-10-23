import 'package:flutter/material.dart';
import 'package:magdsoft/presentation/router/app_router.dart';
import 'package:magdsoft/presentation/styles/color_manager.dart';
import 'package:sizer/sizer.dart';

class DiamondBottomNavigation extends StatelessWidget {
  final List<IconData> itemIcons;

  final int selectedIndex;
  final Function(int) onItemPressed;
  final double? height;
  final Color selectedColor;
  final Color selectedLightColor;
  final Color unselectedColor;
  const DiamondBottomNavigation({
    Key? key,
    required this.itemIcons,
    required this.selectedIndex,
    required this.onItemPressed,
    this.height,
    this.selectedColor = ColorManager.primary,
    this.unselectedColor = const Color(0xffB5C8E7),
    this.selectedLightColor = ColorManager.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.2.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 6.2.h,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              splashColor: selectedColor.withOpacity(0.5),
                              onTap: () {
                                onItemPressed(0);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(
                                  itemIcons[0],
                                  color: selectedIndex == 0
                                      ? selectedColor
                                      : unselectedColor,
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              splashColor: selectedColor.withOpacity(0.5),
                              onTap: () {
                                onItemPressed(1);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(
                                  itemIcons[1],
                                  color: selectedIndex == 1
                                      ? selectedColor
                                      : unselectedColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 3),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              splashColor: selectedColor.withOpacity(0.5),
                              onTap: () {
                                onItemPressed(2);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(
                                  itemIcons[2],
                                  color: selectedIndex == 2
                                      ? selectedColor
                                      : unselectedColor,
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              splashColor: selectedColor.withOpacity(0.5),
                              onTap: () {
                                onItemPressed(3);
                                Navigator.pushReplacementNamed(
                              context, Routes.helpScreen);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(
                                  itemIcons[3],
                                  color: selectedIndex == 3
                                      ? selectedColor
                                      : unselectedColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                  height: 70,
                  width: 70,
                  transform: Matrix4.translationValues(0.0, -3.h, 0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          ColorManager.primary.withOpacity(1),
                          ColorManager.primary.withOpacity(0.71),
                          ColorManager.primary.withOpacity(0),
                        ]),
                  ),
                  child: const Icon(
                    Icons.home,
                    color: ColorManager.white,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
