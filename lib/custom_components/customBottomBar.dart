import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testproject/custom_components/customText.dart';
import 'package:testproject/module/Product_Screen/view/myCart.dart';
import 'package:testproject/module/Product_Screen/view/product.dart';
import 'package:testproject/utils/app_colors.dart';

import '../utils/appStrings.dart';
import '../utils/assetsPath.dart';

class CustomBottomBar extends StatefulWidget {
  int? currentIndex;

  CustomBottomBar({Key? key, this.currentIndex}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int? _currentIndexx = 0;

  final List<Widget> _pages = [
    //Text(""),
     const ProductScreen(),
     const ProductScreen(),
     const MyCart(),
    // Forecast(),
    // TrackingScreen(),
  ];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndexx = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    bool iskeyboard = MediaQuery.of(context).viewInsets.bottom != 0.0;
    print(iskeyboard);
    return Scaffold(
        backgroundColor: AppColors.WhiteColor,
        extendBody: true,
        body: Container(
          child: _pages[_currentIndexx!],
        ),
        bottomNavigationBar: iskeyboard
            ? null
            : Container(
          height: 82.h,

          child: Container(
              decoration: const BoxDecoration(
                  //borderRadius: BorderRadius.circular(15),
                  //  color: Colors.red,
                  color: Colors.white,

              ),
              height: 66.h,
              width: 350,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndexx = 0;
                          //_pageController!.jumpToPage(_currentIndex!);
                        });
                      },
                      child: Column(
                        children: [

                          Icon(Icons.home,size: 25.sp, color:_currentIndexx == 0
                              ? AppColors.black
                              : Colors.grey[600],),

                          SizedBox(height: 10.h,),
                          CustomText(
                            text: "Home",
                            fontcolor: _currentIndexx == 0
                                ? AppColors.black
                                : Colors.grey[600],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndexx = 1;
                          //  _pageController!.jumpToPage(_currentIndex!);
                        });
                      },
                      child: Column(
                        children: [
                          Icon(Icons.favorite,size: 25.sp, color:_currentIndexx == 1
                              ? AppColors.black
                              : Colors.grey[600],),

                          SizedBox(height: 10.h,),
                          CustomText(
                            text: "Wishlist",
                            fontcolor: _currentIndexx == 1
                                ? AppColors.black
                                : Colors.grey[600],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ),

                      InkWell(
                        onTap: () {
                          setState(() {
                            _currentIndexx = 2;
                            //_pageController!.jumpToPage(_currentIndex!);
                          });
                        },
                        child: Column(
                          children: [
                            Icon(Icons.add_shopping_cart_rounded,size: 25.sp, color:_currentIndexx == 2
                                ? AppColors.black
                                : Colors.grey[600],),
                            SizedBox(height: 10.h,),
                            CustomText(
                              text: "My Cart",
                              fontcolor: _currentIndexx == 2
                                  ? AppColors.black
                                  : Colors.grey[600],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              )),
        ));
  }
}
