import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testproject/custom_components/customAppBar.dart';
import 'package:testproject/custom_components/customButton.dart';
import 'package:testproject/custom_components/customText.dart';
import 'package:testproject/provider/cartProvider.dart';
import 'package:testproject/utils/appNavigation.dart';
import 'package:testproject/utils/app_colors.dart';
import 'package:testproject/utils/assetsPath.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  double shipmentCost = 0;
  double? totalCost;
  int? totalItem;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    totalCost = context.read<CartProvider>().calculateTotalCost();
    totalItem = context.read<CartProvider>().cartItems.length;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.1),
      appBar: CustomAppBar(
        text: 'My Cart',
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
          // AppNavigation.navigatorPop(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              children: [
                //-----------AddToCardWidget--------//
                Consumer<CartProvider>(
                  builder: (context, val, _) {
                    shipmentCost = val.shipmentCost;
                    totalCost = val.calculateTotalCost();
                    totalItem = val.cartItems.length;
                    return val.cartItems.isEmpty
                        ? CustomText(
                            text: "No Data Found",
                            fontsize: 18,
                            fontcolor: AppColors.black.withOpacity(0.5),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: val.cartItems.length,
                            itemBuilder: (context, index) {
                              return addToCartWidget(
                                  index: index,
                                  name: val.cartItems[index].name,
                                  price: val.cartItems[index].price,
                                  quantity: val.cartItems[index].quantity,
                                  incrementOnTap: () {
                                    setState(() {
                                      if (val.cartItems[index].quantity !=
                                          null) {
                                        val.cartItems[index].quantity =
                                            val.cartItems[index].quantity! + 1;
                                        print("quantity");
                                        print(val.cartItems[index].quantity);
                                        totalCost = context
                                            .read<CartProvider>()
                                            .calculateTotalCost();
                                      }
                                    });
                                  },
                                  decrementOnTap: () {
                                    setState(() {
                                      if (val.cartItems[index].quantity !=
                                          null) {
                                        val.cartItems[index].quantity == 1
                                            ? null
                                            : val.cartItems[index].quantity =
                                                val.cartItems[index].quantity! -
                                                    1;
                                        print("quantity");
                                        print(val.cartItems[index].quantity);
                                        totalCost = context
                                            .read<CartProvider>()
                                            .calculateTotalCost();
                                      }
                                    });
                                  });
                            },
                          );
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                //--------PromoCodeTextField---------//
                promoCodeTextField(),

                const SizedBox(
                  height: 20,
                ),

                //-------------SubTotalContainer--------------//
                billingContainer(),

                CustomButton(
                  message: "Proceed To Checkout",
                  buttonColor: AppColors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column billingContainer() {
    return Column(
      children: [
        Container(
          height: 40.h,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1,
          ))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(
                    text: "SubTotal ",
                    textOverflow: TextOverflow.ellipsis,
                    fontcolor: AppColors.black,
                    fontweight: FontWeight.bold,
                    fontsize: 17,
                    max_lines: 1,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: "\$${totalCost} ",
                        textOverflow: TextOverflow.ellipsis,
                        fontcolor: AppColors.black,
                        fontweight: FontWeight.bold,
                        fontsize: 18,
                        max_lines: 1,
                      ),
                      CustomText(
                        text: "USD ",
                        textOverflow: TextOverflow.ellipsis,
                        fontcolor: AppColors.black.withOpacity(0.5),
                        fontsize: 16,
                        max_lines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 40.h,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1,
          ))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(
                    text: "Shipping ",
                    textOverflow: TextOverflow.ellipsis,
                    fontcolor: AppColors.black,
                    fontweight: FontWeight.bold,
                    fontsize: 17,
                    max_lines: 1,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: "\$$totalCost ",
                        textOverflow: TextOverflow.ellipsis,
                        fontcolor: AppColors.black,
                        fontweight: FontWeight.bold,
                        fontsize: 18,
                        max_lines: 1,
                      ),
                      CustomText(
                        text: "USD ",
                        textOverflow: TextOverflow.ellipsis,
                        fontcolor: AppColors.black.withOpacity(0.5),
                        fontsize: 16,
                        max_lines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 40.h,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1,
          ))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(
                    text: "Bag Total ",
                    textOverflow: TextOverflow.ellipsis,
                    fontcolor: AppColors.black,
                    fontweight: FontWeight.bold,
                    fontsize: 17,
                    max_lines: 1,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: "($totalItem items) ",
                        textOverflow: TextOverflow.ellipsis,
                        fontcolor: AppColors.black,
                        fontsize: 14,
                        max_lines: 1,
                      ),
                      CustomText(
                        text: "\$$totalCost",
                        textOverflow: TextOverflow.ellipsis,
                        fontcolor: AppColors.black,
                        fontweight: FontWeight.bold,
                        fontsize: 18,
                        max_lines: 1,
                      ),
                      CustomText(
                        text: "USD ",
                        textOverflow: TextOverflow.ellipsis,
                        fontcolor: AppColors.black.withOpacity(0.5),
                        fontsize: 16,
                        max_lines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Container promoCodeTextField() {
    return Container(
      width: 0.9.sw,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 0.5.sw,
              // color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    hintText: "Promo Code",
                    fillColor: AppColors.WhiteColor,
                    filled: true,
                    focusColor: AppColors.WhiteColor,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.r),
                      borderSide:
                          BorderSide(color: AppColors.WhiteColor, width: 2.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 90.w,
              height: 40.h,
              decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: CustomText(
                  text: "Apply",
                  fontcolor: AppColors.WhiteColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget addToCartWidget(
      {String? name,
      int? index,
      int? price,
      int? quantity,
      VoidCallback? incrementOnTap,
      VoidCallback? decrementOnTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        //height: 100.h,
        decoration: const BoxDecoration(
            // color: Colors.blue
            ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                height: 70.h,
                width: 90.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image: const DecorationImage(
                        image: AssetImage(AssetsPath.shoes1),
                        fit: BoxFit.fill)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 2, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    width: MediaQuery.of(context).size.width * 0.59,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: name ?? "",
                          textOverflow: TextOverflow.ellipsis,
                          fontcolor: AppColors.black,
                          fontweight: FontWeight.bold,
                          fontsize: 18,
                          max_lines: 1,
                        ),

                        //SizedBox(width: 20,),
                        GestureDetector(
                            onTap: () {
                              context.read<CartProvider>().removeCart(index!);
                              totalCost = context
                                  .read<CartProvider>()
                                  .calculateTotalCost();
                              totalItem =
                                  context.read<CartProvider>().cartItems.length;
                            },
                            child: const Icon(Icons.close))
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: "\$$price",
                        textOverflow: TextOverflow.ellipsis,
                        fontcolor: Colors.grey[400],
                        fontsize: 15,
                        max_lines: 1,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    width: MediaQuery.of(context).size.width * 0.59,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "\$${price}",
                          textOverflow: TextOverflow.ellipsis,
                          fontcolor: AppColors.black,
                          fontweight: FontWeight.bold,
                          fontsize: 18,
                          max_lines: 1,
                        ),

                        //SizedBox(width: 20,),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: decrementOnTap,
                              child: Container(
                                  height: 25.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                      //color: Colors.black,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black)),
                                  child: Icon(Icons.remove)),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            CustomText(
                              text: quantity.toString(),
                              fontcolor: AppColors.black,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: incrementOnTap,
                              child: Container(
                                  height: 25.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black)),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
