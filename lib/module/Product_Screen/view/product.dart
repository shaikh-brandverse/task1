import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testproject/custom_components/customAppBar.dart';
import 'package:testproject/custom_components/customText.dart';
import 'package:testproject/custom_components/customTextField.dart';
import 'package:testproject/model/productModel.dart';
import 'package:testproject/module/Product_Screen/view/productDetails.dart';
import 'package:testproject/provider/cartProvider.dart';
import 'package:testproject/utils/appNavigation.dart';
import 'package:testproject/utils/app_colors.dart';
import 'package:testproject/utils/assetsPath.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController search = TextEditingController();
  // List<bool> toggle = List.generate(10, (index) => false);

  List<Product> mapList = [
    Product(
      id: 1,
      name: 'Flash',
      price: 450,
      quantity: 1,
      image: AssetsPath.shoes1,
    ),
    Product(
      id: 2,
      name: 'Parish',
      price: 250,
      quantity: 1,
      image: AssetsPath.shoes1,
    ),
    Product(
      id: 3,
      name: '1st Step',
      price: 750,
      quantity: 1,
      image: AssetsPath.shoes1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black.withOpacity(0.1),
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
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Column(children: [
              //------SearchTextField-------//
              customSearchTextField(),
              SizedBox(
                height: 10.h,
              ),
              GridView.count(
                crossAxisCount: 2,
                padding:const EdgeInsets.all(4.0),
                childAspectRatio: 5.0 / 8.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  mapList.length,
                  (index) {
                    return productContainer(
                      index: index,
                      name: mapList[index].name,
                      image: mapList[index].image,
                      price: mapList[index].price,
                    );
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget productContainer({int? index, String? image, String? name, int? price}) {
    return InkWell(
      onTap: () {
        AppNavigation.navigateTo(
            context,
            ProductDeatils(
              index: index,
              image: image,
              name: name,
              mapList: Product(
                  image: mapList[index].image,
                  id: mapList[index].id,
                  name: mapList[index].name,
                  price: mapList[index].price,
                  quantity: 1
              ),
            ));
      },
      child: Container(
        height: 300.h,
        width: 160.w,
        decoration: const BoxDecoration(
            // color: Colors.black,

            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 190.h,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                  //color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(image ?? ""),
                    fit: BoxFit.cover,
                  )),
            ),
            CustomText(
              text: name ?? "",
              fontweight: FontWeight.bold,
              fontsize: 18,
              textOverflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "\$$price" ?? "",
                  fontcolor: Colors.grey[700],
                  fontsize: 13.sp,
                  textOverflow: TextOverflow.ellipsis,
                ),
                GestureDetector(
                    onTap: () {
                      context.read<CartProvider>().addToCart(mapList[index]);
                      setState(() {
                        context.read<CartProvider>().toggle[index!] = true;
                      });
                    },
                    child: context.read<CartProvider>().toggle[index!] == true
                        ? const Icon(Icons.done)
                        : const Icon(Icons.add))
              ],
            )
          ],
        ),
      ),
    );
  }

  CustomTextField customSearchTextField() {
    return CustomTextField(
      type: 1,
      labelText: "Search",
      controller: search,
      obscureText: false,
      text: "Search",
      prefixiconVisible: true,
      image: AssetsPath.search,
      maxline: 30,
      textkeyboardType: TextInputType.emailAddress,
      imageColor: AppColors.darkGreen,
      suffixiconVisible: true,
      Suffiximage: AssetsPath.microphone,
      scale: 20,
    );
  }
}
