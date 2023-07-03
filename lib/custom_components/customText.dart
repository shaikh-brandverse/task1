import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testproject/utils/app_colors.dart';
import '../utils/appStrings.dart';

class CustomText extends StatelessWidget {

  final String text;
  final Color? fontcolor;
  final TextAlign textAlign;
  final FontWeight fontweight;
  final bool underlined,linethrough;

  final double fontsize;
  final double? line_spacing;
  final int? max_lines;
  final double textScaleFactor;
  final bool isSp,italic;
  final TextOverflow textOverflow;
  //final double minfontsize,scalefactor,fontsize;

  CustomText({this.text="",this.fontcolor=AppColors.darkGreen,this.fontsize=15,
    this.textAlign=TextAlign.start, this.fontweight=FontWeight.normal,
    this.underlined=false,this.italic=false,
    this.line_spacing=1.2,this.isSp=true,
    this.max_lines,//double line_spacing=1.2,
   this.linethrough=false,this.textScaleFactor=1.0,
    this.textOverflow = TextOverflow.visible
    // this.minfontsize=10,//this.scalefactor,
  });

  @override
  Widget build(BuildContext context) {
    //  double text_scale_factor=(media.size.width*media.size.height)/328190;
    //print("new text scale factor: ${text_scale_factor}");
    return Text(text,//textScaleFactor: textScaleFactor,
      maxLines: max_lines,
      overflow: max_lines!=null?TextOverflow.ellipsis:TextOverflow.visible,
      textAlign:textAlign,
      style:TextStyle(color: fontcolor,
        fontWeight: fontweight,height: line_spacing,
        fontStyle: italic?FontStyle.italic:FontStyle.normal,
        fontSize: isSp?fontsize.sp:fontsize,
        // fontSize: (fontsize*0.89).sp,


        overflow: textOverflow,
        decorationThickness: 2.0,
        decoration: underlined?TextDecoration.underline:(linethrough?TextDecoration.lineThrough:
        TextDecoration.none),),
    );
  }

}

class CustomRichText extends StatelessWidget {
  //final String text1,text2;
  final TextAlign textAlign;
  final List<TextSpan> spans;
  final double linespacing;
  final double fontsize;
  const CustomRichText({
    Key? key,
    required this.spans,
    this.fontsize = 15,
    this.linespacing = 1.2,
    this.textAlign = TextAlign.start,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: textAlign,
        text: TextSpan(
          style: TextStyle(
              color: AppColors.WhiteColor,
              height: linespacing,

              fontSize: fontsize),
          children: spans,
        ));
  }
}

class CustomSpan extends TextSpan {
  CustomSpan({
    String text = "",
    Color fontColor = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    bool underlined = false,
    bool lineThrough = false,
  }) : super(
      text: text,
      style: TextStyle(
        color: fontColor,
        fontWeight: fontWeight,
        decoration: underlined
            ? TextDecoration.underline
            : (lineThrough
            ? TextDecoration.lineThrough
            : TextDecoration.none),
      ));
}
