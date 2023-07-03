import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testproject/custom_components/customAppBar.dart';
import 'package:testproject/custom_components/customText.dart';
import 'package:testproject/model/productModel.dart';
import 'package:testproject/provider/cartProvider.dart';
import 'package:testproject/utils/appNavigation.dart';
import 'package:testproject/utils/app_colors.dart';
import 'package:testproject/utils/assetsPath.dart';

class ProductDeatils extends StatefulWidget {
  String? image;
  String? name;
  Product? mapList;
  int? index;

  ProductDeatils({this.mapList, this.name, this.image, this.index, super.key});

  @override
  State<ProductDeatils> createState() => _ProductDeatilsState();
}

class _ProductDeatilsState extends State<ProductDeatils> {
  String containeSize = "42";
  int _selectedIndex = 0;
  List<String> size = [
    "40",
    "41",
    "42",
    "43",
    "44",
  ];
  int count = 0;
  double value = 3.5;

  @override
  Widget build(BuildContext context) {
    // print(widget.mapList!.length);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: CustomAppBar(
        text: 'Shoes',
        iconVisible: true,
        image: AssetsPath.arrowBack,
        image2: AssetsPath.bell,
        showImageCircle: true,
        icon2Visible: true,
        showText: false,
        image1colorr: AppColors.WhiteColor,
        OnTap2: () {
          FocusScope.of(context).unfocus();
        },
        OnTap: () {
          FocusScope.of(context).unfocus();
          AppNavigation.navigatorPop(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mainImageContainer(),
                imageChangerListView(),
                CustomText(
                  text: "New Balance 530 White Natural Indigo (${widget.name})",
                  fontcolor: AppColors.black,
                  fontsize: 25,
                  fontweight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  text:
                      "For classic and sophisticated sneaker look. It is har to beat the new balance 530 silver navy",
                  fontcolor: AppColors.black,
                  fontsize: 15,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Size",
                  fontcolor: AppColors.black,
                  fontsize: 20.sp,
                  fontweight: FontWeight.bold,
                ),
                sizeListView(),
                addToCartContainer(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addToCartContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "New Balance",
                  fontcolor: AppColors.black,
                  fontsize: 18.sp,
                  fontweight: FontWeight.bold,
                ),
                CustomText(
                  text: "Size",
                  fontcolor: AppColors.black,
                  fontsize: 20.sp,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Size $containeSize / color: Grey",
                  fontcolor: AppColors.black.withOpacity(0.5),
                  fontsize: 14.sp,
                ),
                Center(
                  child: RatingStars(
                    value: value,
                    onValueChanged: (v) {
                      //
                      setState(() {
                        value = v;
                      });
                    },
                    starBuilder: (index, color) => Icon(
                      Icons.star,
                      color: color,
                    ),
                    starCount: 5,
                    starSize: 18,
                    valueLabelColor: const Color(0xff9b9b9b),
                    valueLabelTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12.0),
                    valueLabelRadius: 10,
                    maxValue: 5,
                    starSpacing: 2,
                    maxValueVisibility: false,
                    valueLabelVisibility: false,
                    animationDuration: const Duration(milliseconds: 1000),
                    valueLabelPadding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    valueLabelMargin: const EdgeInsets.only(right: 8),
                    starOffColor: const Color(0xffe7e8ea),
                    starColor: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "\$85.99",
                  fontcolor: AppColors.black.withOpacity(0.5),
                  fontsize: 14.sp,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  height: 30.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.mapList!.quantity == 0
                                  ? null
                                  : widget.mapList!.quantity--;
                              // count--;
                            });
                          },
                          child: const Icon(Icons.remove)),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomText(
                        text: widget.mapList!.quantity.toString(),
                        fontcolor: AppColors.black,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.mapList!.quantity++;
                            });
                          },
                          child: const Icon(Icons.add)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<CartProvider>().addToCart(widget.mapList!);
                    AppNavigation.navigatorPop(context);
                  },
                  child: Container(
                    height: 40.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: CustomText(
                        text: "Cart",
                        fontcolor: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget sizeListView() {
    return SizedBox(
      height: 100,
      width: 500,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                    containeSize = size[index];
                    //toggle[index] = !toggle[index]!;
                   // print(toggle[index]);
                  });
                },
                child: Container(
                  height: 60.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                      color:_selectedIndex == index
                          ? Colors.black
                          : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Center(
                    child: CustomText(
                      text: size[index],
                      fontcolor:
                      _selectedIndex == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }

  Widget mainImageContainer() {
    return Container(
      height: 250.h,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          //color: Colors.black,
          image: DecorationImage(
        image: AssetImage(
          AssetsPath.shoes2,
        ),
        scale: 5,
        // fit: BoxFit.cover,
      )),
    );
  }

  Widget imageChangerListView() {
    return SizedBox(
      height: 100,
      width: 500,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Container(
                height: 60.h,
                width: 60.w,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image:
                        DecorationImage(image: AssetImage(AssetsPath.shoes3))),
              ));
        },
      ),
    );
  }
}
