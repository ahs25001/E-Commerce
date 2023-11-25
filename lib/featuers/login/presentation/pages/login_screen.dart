import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_components.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/featuers/sinUp/presentation/bloc/sign_up_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.screenStatus == ScreenStatus.loading) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                    color: AppColors.blue,
                    size: 90.sp,
                  ),
                ),
              ),
            );
          } else if (state.screenStatus == ScreenStatus.successfully) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouts.home,
              (route) => false,
            );
          } else if (state.screenStatus == ScreenStatus.failures) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(AppStrings.error),
                  content: Text(state.failures?.massage ?? ""),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text(AppStrings.cancel))
                  ],
                );
              },
            );
          }
        },
        builder: (context, state) {
          bool showPassword = state.screenStatus == ScreenStatus.showPassword;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.blue,
            body: Form(
              key: LoginBloc.get(context).formKey,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 18.0.w,
                    right: 18.0.w,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 91.h,
                      ),
                      Image.asset(
                        AppImages.routLogo,
                        width: 637.w,
                        height: 61.h,
                      ),
                      SizedBox(
                        height: 86.9.h,
                      ),
                      Text(
                        AppStrings.welcomeMassage,
                        // textAlign: TextAlign.center,
                        style: AppStyles.h1,
                      ),
                      Text(
                        AppStrings.signinMassage,
                        style: AppStyles.h3,
                        // textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Text(
                        AppStrings.email,
                        style: AppStyles.h2,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      AppComponents.field(
                        controller: LoginBloc.get(context).emilController,
                        hintText: AppStrings.enterEmail,
                        isEmail: true,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        AppStrings.password,
                        style: AppStyles.h2,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      AppComponents.field(
                        showPassword: showPassword,
                        function: () {
                          LoginBloc.get(context)
                              .add(ShowPasswordLoginButtonEvent());
                        },
                        isPassword: true,
                        hintText: AppStrings.password,
                        controller: LoginBloc.get(context).passwordController,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          AppStrings.forgotPassword,
                          style: AppStyles.h3,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      SizedBox(
                        height: 56.h,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (LoginBloc.get(context)
                              .formKey
                              .currentState!
                              .validate()) {
                            LoginBloc.get(context).add(LoginButtonEvent(
                                userName:
                                    LoginBloc.get(context).emilController.text,
                                password: LoginBloc.get(context)
                                    .passwordController
                                    .text));
                          }
                        },
                        style: AppStyles.buttonStyle,
                        child: Text(
                          AppStrings.login,
                          style: AppStyles.h2.copyWith(color: AppColors.blue),
                        ),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account? ",
                            style: AppStyles.h3,
                          ),
                          InkWell(
                              onTap: () =>
                                  Navigator.pushNamed(context, AppRouts.sinUp),
                              child: Text(
                                "Create Account",
                                style: AppStyles.h3,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
