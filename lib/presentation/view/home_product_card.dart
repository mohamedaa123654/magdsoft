import 'package:flutter/material.dart';
import 'package:magdsoft/presentation/styles/color_manager.dart';
import 'package:sizer/sizer.dart';

class HomeProductCard extends StatelessWidget {
  final String image;
  final String company;
  final String name;
  final String price;
  void Function()? onTap;

  HomeProductCard({
    Key? key,
    required this.image,
    required this.company,
    required this.name,
    required this.price,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.7.h),
        child: Container(
          width: 39.w,
          height: 26.h,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 8,
                  spreadRadius: 5,
                  offset: const Offset(2, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              color: ColorManager.white),
          child: Stack(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: 39.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          blurRadius: 6,
                          offset:
                              const Offset(2, 2), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: ColorManager.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Image.network(
                          image,
                          fit: BoxFit.fitWidth,
                        ),
                        Positioned(
                            top: 1.h,
                            right: 1.w,
                            child: Icon(
                              Icons.favorite_outlined,
                              size: 18.sp,
                              color: ColorManager.white,
                              shadows: const [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 5,
                                    blurStyle: BlurStyle.solid),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.5.h, left: 2.w, right: 2.w),
                  child: Text(
                    company,
                    style:
                        TextStyle(color: ColorManager.primary, fontSize: 15.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: ColorManager.text, fontSize: 10.sp),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
                  child: Text(
                    '$price EGP',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: ColorManager.text, fontSize: 10.sp),
                  ),
                ),
              ]),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 9.3.w,
                  height: 4.3.h,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          ColorManager.primary.withOpacity(1),
                          ColorManager.primary.withOpacity(0),
                        ]),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 16.sp,
                    color: ColorManager.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
