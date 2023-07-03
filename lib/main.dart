import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:testproject/custom_components/customBottomBar.dart';
import 'package:testproject/provider/cartProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return  MultiProvider(
            providers: [
              ChangeNotifierProvider<CartProvider>(
                create: (context) => CartProvider(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: CustomBottomBar(currentIndex: 0,),

            ),
          );
        });
  }
}

