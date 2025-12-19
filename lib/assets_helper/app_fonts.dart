import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scube_app/assets_helper/app_colors.dart';

class TextFontStyle {
  TextFontStyle._();

  /*custom font use anywhere*/

  static final textStyle20UrbanistW500 = GoogleFonts.urbanist(
    color: AppColor.cFFFFFF,
    fontSize: 30.sp,
    fontWeight: FontWeight.w500,
  );

  static final textStyle18urbanistsW500 = GoogleFonts.urbanist(
    color: AppColor.cFFFFFF,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    height: 1.50.h,
    letterSpacing: 0,
  );

  static final textStyle18c191A1FurbanistsW500 = GoogleFonts.urbanist(
    color: AppColor.c191A1F,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    height: 1.50.h,
    letterSpacing: 0,
  );
}
