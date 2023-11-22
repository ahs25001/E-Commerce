import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppComponents {
  static TextFormField field(
      {required String hintText,
      required TextEditingController controller,
      bool isPassword = false,
      bool isEmail = false,
      Function? function,
      bool? showPassword}) {
    return TextFormField(
      validator: (value) {
        if (isEmail) {
          if (value!=null&&value!="" &&!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value)) {
            return AppStrings.emailNotValid;
          } else if (value == null || value.isEmpty||value=="") {
            return AppStrings.enterEmail;
          }
        } else {
          if (value == null || value.isEmpty) {
            return hintText;
          }
        }
      },
      keyboardType: (!isPassword)
          ? TextInputType.emailAddress
          : TextInputType.visiblePassword,
      controller: controller,
      autofocus: false,
      obscureText: !(showPassword ?? false) && isPassword,
      decoration: InputDecoration(
          suffixIconColor: Colors.black,
          suffixIcon: (isPassword)
              ? ((!(showPassword ?? false))
                  ? (IconButton(
                      icon: const Icon(Icons.visibility_off),
                      onPressed: () {
                        if (function != null) {
                          function();
                        }
                      },
                    ))
                  : IconButton(
                      icon: const Icon(Icons.remove_red_eye),
                      onPressed: () {
                        if (function != null) {
                          function();
                        }
                      },
                    ))
              : const SizedBox(),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blue),
              borderRadius: BorderRadius.circular(18.r)),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.r),
            borderSide: BorderSide(color: AppColors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.r),
            borderSide: BorderSide(color: AppColors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.r),
            borderSide: BorderSide(color: AppColors.blue),
          )),
    );
  }
}
