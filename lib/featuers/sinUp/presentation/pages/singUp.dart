import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_components.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../login/presentation/bloc/login_bloc.dart';
import '../bloc/sign_up_bloc.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
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
                context, AppRouts.login, (route) => false);
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
          return Form(
            key: SignUpBloc.get(context).formKey,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: AppColors.blue,
              body: Padding(
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
                        height: 49.9.h,
                      ),
                      Text(
                        AppStrings.fullName,
                        style: AppStyles.h2,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      AppComponents.field(
                        hintText: AppStrings.fullName,
                        controller: SignUpBloc.get(context).nameController,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        AppStrings.phone,
                        style: AppStyles.h2,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      AppComponents.field(
                          hintText: AppStrings.phone,
                          controller: SignUpBloc.get(context).phoneController),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        AppStrings.email,
                        style: AppStyles.h2,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      AppComponents.field(
                          hintText: AppStrings.enterEmail,
                          controller: SignUpBloc.get(context).emailController,
                          isEmail: true),
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
                          SignUpBloc.get(context)
                              .add(ShowPasswordSignButtonEvent());
                        },
                        isPassword: true,
                        hintText: AppStrings.password,
                        controller: SignUpBloc.get(context).passwordController,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (SignUpBloc.get(context)
                              .formKey
                              .currentState!
                              .validate()) {
                            SignUpBloc.get(context).add(RegisterEvent(
                                name:
                                    SignUpBloc.get(context).nameController.text,
                                email: SignUpBloc.get(context)
                                    .emailController
                                    .text,
                                phone: SignUpBloc.get(context)
                                    .phoneController
                                    .text,
                                password: SignUpBloc.get(context)
                                    .passwordController
                                    .text,
                                rePassword: SignUpBloc.get(context)
                                    .passwordController
                                    .text));
                          }
                        },
                        style: AppStyles.buttonStyle,
                        child: Text(
                          AppStrings.signUp,
                          style: AppStyles.h2.copyWith(color: AppColors.blue),
                        ),
                      ),
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
