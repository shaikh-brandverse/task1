import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:testproject/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? text;
  final String? image;
  final Color? imageColor;
  final Color? suffixImageColor;
  final String? labelText;
  final double? type;
  final String? Suffiximage;
  final TextInputType? textkeyboardType;
  final bool obscureText;
  final bool? readOnly;
  final double? scale;
  final int? maxline;
  bool? prefixiconVisible = false;
  bool? suffixiconVisible = false;
  final VoidCallback? suffixIconOnTap;
  final TextEditingController? controller;

  CustomTextField(
      {this.type,
        this.suffixImageColor,
        this.labelText,
        this.imageColor,
        this.maxline,
        this.textkeyboardType,
        this.scale,
        this.readOnly,
        this.suffixIconOnTap,
        this.text,
        this.image,
        this.obscureText = false,
        this.controller,
        this.prefixiconVisible,
        this.Suffiximage,
        this.suffixiconVisible});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(

        child: TextFormField(

          maxLength: maxline ?? 31,

          onTap: readOnly == true ? suffixIconOnTap : null,
          keyboardType: textkeyboardType ?? TextInputType.text,
          controller: controller,
          obscureText: obscureText,
          readOnly: readOnly ?? false,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500
          ),
          decoration: InputDecoration(

              fillColor: AppColors.WhiteColor,
              filled: true,
              focusColor: AppColors.WhiteColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.r),
                borderSide: BorderSide(color: AppColors.WhiteColor, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.WhiteColor, width: 2.0),
                borderRadius: BorderRadius.circular(40.r),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red, width: 2.0),
                borderRadius: BorderRadius.circular(5.r),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red, width: 2.0),
                borderRadius: BorderRadius.circular(5.r),
              ),
              errorMaxLines: 3,
              counterText: '',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              hintText: text,
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.6),
              ),
              prefixIcon: prefixiconVisible == true
                  ? Container(
                padding: const EdgeInsets.all(14),
                child: ImageIcon(
                  AssetImage(
                    image!,
                  ),
                  size: 0,
                  color: imageColor ?? Colors.white,
                ),
              )
                  : null,
              //image!,scale: 3.5,color:imageColor?? Colors.white,):null,
              suffixIcon: suffixiconVisible == true
                  ? GestureDetector(
                  onTap: suffixIconOnTap,
                  child: Image.asset(
                    Suffiximage!,
                    scale: scale ?? 23,
                    color:suffixImageColor ?? Colors.black.withOpacity(0.6),
                  ))
                  : null),



        ),
      ),
    );
  }
}
