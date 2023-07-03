import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testproject/utils/app_colors.dart';
class CustomButton extends StatelessWidget {
  final String? message;
  final Color? buttonColor, textColor;
  final String? image;
  final bool isIcon;
  final double? height;
  final double? widthsize;
  final VoidCallback? OnTap;
  CustomButton(
      {this.widthsize,
        this.image,
        this.message,
        this.height,
        this.buttonColor,
        this.textColor,
        this.OnTap,
        this.isIcon = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Container(
        // padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
        height: height ?? 42.h,
        width: widthsize??320.w,
        decoration: BoxDecoration(
          gradient:buttonColor==null? LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,

            colors: [
              AppColors.darkGreen,
              AppColors.lightGreen,

            ],
          ):null,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 9,
              offset: Offset(0, 3),
            )
          ],
          color: buttonColor,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                    visible: isIcon,
                    child: Image(
                      image: AssetImage(image ?? ""),
                      height: 20,
                      width: 20,
                      color: Colors.white,
                    )),
                SizedBox(width: isIcon ? 16 : 0),
                Text(
                  message!,
                  style: TextStyle(

                      fontSize: 15,
                      //fontFamily: AppStrings.Metropolis,
                      fontWeight: FontWeight.w600,
                      color: textColor??Colors.white ),
                ),

              ]),
        ),
      ),
    );
  }
}