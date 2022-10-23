import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft/constants/app_constants.dart';
import 'package:magdsoft/constants/strings_manager.dart';
import 'package:magdsoft/presentation/router/app_router.dart';
import 'package:magdsoft/presentation/screens/shared/cubit/cubit.dart';
import 'package:magdsoft/presentation/screens/shared/cubit/states.dart';
import 'package:magdsoft/presentation/styles/color_manager.dart';
import 'package:magdsoft/presentation/view/shared_screen_background_color.dart';
import 'package:sizer/sizer.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);

          return Scaffold(
            body: SharedScreenBackgroundColor(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: ListView(
                  physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
                  children: [
                  const ButtonBack(),
                  Padding(
                    padding: EdgeInsets.only(top: 1.7.h, left: 2.7.w),
                    child: Text(
                      cubit.products[id].name,
                      style: TextStyle(
                          color: ColorManager.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.6.h, left: 2.7.w),
                    child: Text(
                      'Type: ${cubit.products[id].type}',
                      style: TextStyle(
                          color: ColorManager.white, fontSize: 12.5.sp),
                    ),
                  ),
                  ProductImage(cubit: cubit),
                  CompanyCard(cubit: cubit),
                  PriceRow(cubit: cubit),
                  const Divider(),
                  OverviewTabBar(
                    cubit: cubit,
                  ),
                ]),
              ),
            ),
          );
        });
  }
}

///TabBarView Contain Overview & Spesification & Review
class OverviewTabBar extends StatelessWidget {
  OverviewTabBar({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    ///tabBarView Data
    TabBarView tabBarView = TabBarView(children: [
      Padding(
        padding: EdgeInsets.only(top: 1.7.h),
        child: Text(
          cubit.products[id].description,
          maxLines: 22,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: ColorManager.lightGrey,
            fontSize: 13.sp,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 1.7.h),
        child: Text(
          cubit.products[id].description,
          maxLines: 22,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: ColorManager.lightGrey,
            fontSize: 13.sp,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 1.7.h),
        child: Text(
          cubit.products[id].description,
          maxLines: 22,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: ColorManager.lightGrey,
            fontSize: 13.sp,
          ),
        ),
      ),
    ]);

    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        children: [
          SizedBox(
            width: 100.w,
            child: TabBar(
                labelColor: ColorManager.text,
                indicatorPadding: EdgeInsets.only(top: 4.5.h),
                indicator: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          ColorManager.primary.withOpacity(1),
                          ColorManager.primary.withOpacity(0),
                        ]),
                    shape: BoxShape.circle),
                enableFeedback: true,
                unselectedLabelColor: ColorManager.lightGrey,
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                onTap: (index) {
                  cubit.emit(MainChangeTabBarState());
                },
                tabs: cubit.tabTitles),
          ),
          SizedBox(
              height: 54.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.h),
                child: tabBarView,
              )),
        ],
      ),
    );
  }
}

///Divider
class Divider extends StatelessWidget {
  const Divider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.25.w, vertical: 3.2.h),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: ColorManager.text,
      ),
    );
  }
}

///Row Contain Product Price and AddToCart Button
class PriceRow extends StatelessWidget {
  const PriceRow({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 1.7.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.price,
                style: TextStyle(
                    color: ColorManager.lightGrey,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.6.h),
                child: Text(
                  '${cubit.products[id].price} EGP',
                  style: TextStyle(color: ColorManager.text, fontSize: 15.sp),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 3.h),
            child: Container(
              height: 4.7.h,
              width: 48.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      ColorManager.primary.withOpacity(1),
                      ColorManager.primary.withOpacity(0),
                    ]),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    spreadRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  AppStrings.addToCart,
                  style: TextStyle(color: ColorManager.white, fontSize: 15.sp),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

///Card Contain Company Logo and button to navigate to store
class CompanyCard extends StatelessWidget {
  const CompanyCard({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 2.7.h),
      child: Container(
        height: 7.h,
        width: 84.6.w,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 2,
              spreadRadius: 2,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 2.w),
              child: Container(
                width: 11.6.w,
                height: 11.6.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                    cubit.products[id].image,
                  )),
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 2.7.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${cubit.products[id].company}${AppStrings.officialStore}',
                    style: TextStyle(color: ColorManager.text, fontSize: 14.sp),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.6.h),
                    child: Text(
                      AppStrings.viewStore,
                      style: TextStyle(
                          color: ColorManager.lightGrey, fontSize: 10.sp),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                right: 6.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, Routes.homeRoute);
                    },
                    child: Container(
                      height: 7.w,
                      width: 7.w,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: ColorManager.primary,
                        size: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

///Porduct poster Image and other image for product
class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 1.7.w, top: 1.7.h),
          child: Container(
            height: 32.1.h,
            width: 84.6.w,
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  cubit.products[id].image,
                  height: 23.6.h,
                  width: 64.4.w,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 5.7.w, top: 1.5.h, bottom: 1.5.h, right: 3.7.w),
          child: SizedBox(
            height: 12.7.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: cubit.products.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 3.2.w,
                      ),
                      Container(
                        height: 10.7.h,
                        width: 23.2.w,
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              cubit.products[index].image,
                              height: 5.8.h,
                              width: 16.5.w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ],
    );
  }
}

///Button to Navigate to Main Screen
class ButtonBack extends StatelessWidget {
  const ButtonBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.4.h, left: 2.7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.mainScreen);
            },
            child: Container(
              height: 13.w,
              width: 13.w,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 3,
                    spreadRadius: 3,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: ColorManager.lightGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
