
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles{
  static  TextStyle h1=GoogleFonts.poppins(
    fontSize: 26.sp,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
  static  TextStyle h3=GoogleFonts.poppins(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.w300,
  );
  static  TextStyle h2=GoogleFonts.poppins(
    fontSize: 20.sp,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  static ButtonStyle buttonStyle=ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(horizontal:160.w ,vertical: 23.h),
     backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r))
  );

}