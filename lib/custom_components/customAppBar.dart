import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:testproject/custom_components/customText.dart';
import 'package:testproject/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  String text;
  String? text2;
  String? image;
  double? scale2;
  String? image2;
  bool? iconVisible;
  bool? showImageCircle;
  bool? showText;
  bool? icon2Visible;
  final Color? colorr;
  final Color? image1colorr;
  final VoidCallback? OnTap;
  final VoidCallback? OnTap2;
  CustomAppBar({this.image1colorr=Colors.black,this.scale2,this.showImageCircle=false,this.text2,this.showText=false,this.icon2Visible,this.text="",this.image,this.iconVisible,this.image2,this.colorr,
    this.OnTap,this.OnTap2});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.h);

  @override
  Widget build(BuildContext context) {
    final double iconWidth=50.w;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        width: 1.sw,
        height: preferredSize.height,
        //   height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: iconVisible!,
              child: GestureDetector(
                onTap: OnTap,
                child:
                showImageCircle==true?
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:Colors.transparent
                  ),

                  child:  Image.asset(image!,scale: 3.5,color: AppColors.black,),
                )
                    :
                image!=null? Container(
                    height: 40.h,
                    width: iconWidth,

                    decoration:  BoxDecoration(

                        color: AppColors.darkGreen,
                        shape: BoxShape.circle
                    ),
                    child: Image.asset(image!,scale: 3.5,)
                ):image2!=null?SizedBox(width: iconWidth,):const SizedBox(),
              ),
            ),

            Center(
              child: Text(text,style:  TextStyle(
                  color: colorr ?? AppColors.black ,


                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp
              ),),
            ),
            showText==true?
            Container(

              width: iconWidth,
              child: CustomText(
                text: text2 ?? "",
                fontsize: 14,
                fontcolor:AppColors.darkGreen,
                fontweight: FontWeight.bold,
              ),
            )
                :
            Visibility(
              visible: icon2Visible!,
              child: GestureDetector(
                onTap: OnTap2,
                child: image2!=null? Container(
                    height: 32.h,
                    width: iconWidth,

                    decoration:  BoxDecoration(
                      color: AppColors.WhiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(image2!,scale:scale2 ?? 5,color: AppColors.black,)
                ):image!=null?SizedBox(width: iconWidth,):const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
