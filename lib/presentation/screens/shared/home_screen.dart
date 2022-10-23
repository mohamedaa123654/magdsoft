import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft/constants/app_constants.dart';
import 'package:magdsoft/constants/strings_manager.dart';
import 'package:magdsoft/presentation/router/app_router.dart';
import 'package:magdsoft/presentation/screens/shared/cubit/cubit.dart';
import 'package:magdsoft/presentation/screens/shared/cubit/states.dart';
import 'package:magdsoft/presentation/styles/color_manager.dart';
import 'package:magdsoft/presentation/view/home_category_item.dart';
import 'package:magdsoft/presentation/view/home_product_card.dart';
import 'package:magdsoft/presentation/view/shared_screen_background_color.dart';
import 'package:magdsoft/presentation/widget/componant.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return SharedScreenBackgroundColor(
            child: ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                const SearchBar(),
                const Poster(),
                Categories(cubit: cubit),
                state is MainGetProductsLoadingState
                    ? SizedBox(
                        height: 25.h,
                        child: const Center(child: CircularProgressIndicator()))
                    : ProductsList(cubit: cubit),
              ],
            ),
          );
        });
  }
}

//ListView Contain all productes
class ProductsList extends StatelessWidget {
  const ProductsList({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.h * ((cubit.products.length / 2).ceil()) + 23.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 45.w,
            child: Column(
              children: [
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w, bottom: 3.h),
                    child: Text(
                      AppStrings.recomendedForYou,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style:
                          TextStyle(color: ColorManager.text, fontSize: 21.sp),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 1.w),
                  child: SizedBox(
                    width: 39.w,
                    height: 28.h * (cubit.products.length / 2) + 12.h,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cubit.products.length,
                      itemBuilder: (context, index) {
                        if (cubit.products[index].id % 2 == 0) {
                          return HomeProductCard(
                            onTap: () {
                              id = index;
                              Navigator.pushReplacementNamed(
                                  context, Routes.productDetailsRoute);
                            },
                            image: cubit.products[index].image,
                            company: cubit.products[index].company,
                            name: cubit.products[index].name,
                            price: cubit.products[index].price,
                          );
                        } else {
                          return SizedBox(
                            height: 1.h,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 39.w,
            height: 28.h * (cubit.products.length / 2) + 22.h,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cubit.products.length,
              itemBuilder: (context, index) {
                if (cubit.products[index].id % 2 == 1) {
                  return HomeProductCard(
                    onTap: () {
                      id = index;
                      Navigator.pushReplacementNamed(
                          context, Routes.productDetailsRoute);
                    },
                    image: cubit.products[index].image,
                    company: cubit.products[index].company,
                    name: cubit.products[index].name,
                    price: cubit.products[index].price,
                  );
                } else {
                  return SizedBox(
                    height: 1.h,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

//horizontal ListView for companies
class Categories extends StatelessWidget {
  Categories({Key? key, required this.cubit}) : super(key: key);
  HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 9.6.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        shrinkWrap: true,
        itemCount: cubit.companies.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return CategoryItem(
              image: cubit.companies[index][1],
              name: cubit.companies[index][0],
              bgColor: ColorManager.primary,
            );
          } else {
            return CategoryItem(
              image: cubit.companies[index][1],
              name: cubit.companies[index][0],
            );
          }
        },
      ),
    );
  }
}

// Design for banner
class Poster extends StatelessWidget {
  const Poster({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.4.h, right: 7.w, left: 7.w),
      child: Container(
        width: 86.w,
        height: 19.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: AssetImage('assets/images/poster.png')),
        ),
        child: Stack(children: [
          Positioned(
              bottom: 1.h,
              left: 3.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    AppStrings.newRelease,
                    style: TextStyle(color: ColorManager.white),
                  ),
                  Text(
                    AppStrings.acerPredatorHelios300,
                    style: TextStyle(color: ColorManager.white),
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}

//SearchBar Contain SearchFormFeild & filter Button Design
class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.4.h),
      child: Row(
        children: [
          DefaultTextFormFeild(
            hint: AppStrings.search,
            suffix: Icons.search,
            width: 75,
          ),
          Container(
            height: 13.w,
            width: 13.w,
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 5,
                  spreadRadius: 5,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Icon(
              Icons.filter_list_alt,
              color: ColorManager.lightGrey,
            ),
          )
        ],
      ),
    );
  }
}
