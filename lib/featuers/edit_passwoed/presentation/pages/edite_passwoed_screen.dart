import 'package:e_commerce/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_components.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../bloc/edite_password_bloc.dart';

class EditePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool showRePassword = false;
    bool showNewPassword = false;
    bool showCurrentPassword = false;
    return BlocProvider(
      create: (context) => EditePasswordBloc(),
      child: BlocConsumer<EditePasswordBloc, EditePasswordState>(
        listener: (context, state) {
          if (state.editePasswordScreenStatus ==
              EditePasswordScreenStatus.showRePassword) {
            showRePassword = true;
          } else if (state.editePasswordScreenStatus ==
              EditePasswordScreenStatus.showNewPassword) {
            showNewPassword = true;
          } else if (state.editePasswordScreenStatus ==
              EditePasswordScreenStatus.showCurrentPassword) {
            showCurrentPassword = true;
          } else if (state.editePasswordScreenStatus ==
              EditePasswordScreenStatus.doNotShowCurrentPassword) {
            showCurrentPassword = false;
          } else if (state.editePasswordScreenStatus ==
              EditePasswordScreenStatus.doNotShowNewPassword) {
            showNewPassword = false;
          } else if (state.editePasswordScreenStatus ==
              EditePasswordScreenStatus.doNotShowRePassword) {
            showRePassword = false;
          } else if (state.editePasswordScreenStatus ==
              EditePasswordScreenStatus.loading) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) =>
                  PopScope(
                    canPop:false,
                    child: AlertDialog(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: Center(
                        child: LoadingAnimationWidget.fourRotatingDots(
                          color: AppColors.blue,
                          size: 90.sp,
                        ),
                      ),
                    ),
                  ),
            );
          } else if (state.editePasswordScreenStatus ==
              EditePasswordScreenStatus.passwordChangedSuccess) {
            showDialog(
              context: context,
              builder: (context) {
                return PopScope(
                  canPop:false,
                  child: AlertDialog(
                    title: const Text(AppStrings.success),
                    content: const Text(AppStrings.toLogin),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, AppRouts.login, (route) => false);
                          },
                          child: const Text(AppStrings.done))
                    ],
                  ),
                );
              },
            );
          }
          else if (state.editePasswordScreenStatus ==
              EditePasswordScreenStatus.passwordChangedFulled) {
            showDialog(context: context, builder: (context) {
              return PopScope(
                canPop:false,
                child: AlertDialog(
                  title: const Text(AppStrings.error),
                  content: Text(state.failures?.massage ?? ""),
                  actions: [
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }, child: const Text(AppStrings.cancel))
                  ],
                ),
              );
            },);
          }
        },
        builder: (context, state) {
          return Form(
            key: EditePasswordBloc
                .get(context)
                .formKey,
            child: Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(18.0.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppStrings.changePassword,
                        style: AppStyles.h2.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      AppComponents.field(
                          hintText: AppStrings.enterCurrentPassword,
                          controller: EditePasswordBloc
                              .get(context)
                              .currentPasswordController,
                          showPassword: showCurrentPassword,
                          function: () {
                            if (!showCurrentPassword) {
                              EditePasswordBloc.get(context)
                                  .add(ShowCurrentPasswordEvent());
                            } else {
                              EditePasswordBloc.get(context)
                                  .add(DoNotShowCurrentPasswordEvent());
                            }
                          },
                          isPassword: true),
                      SizedBox(
                        height: 18.h,
                      ),
                      AppComponents.field(
                          showPassword: showNewPassword,
                          function: () {
                            if (!showNewPassword) {
                              EditePasswordBloc.get(context)
                                  .add(ShowNewPasswordEvent());
                            } else {
                              EditePasswordBloc.get(context)
                                  .add(DoNotShowNewPasswordEvent());
                            }
                          },
                          hintText: AppStrings.newPassword,
                          controller: EditePasswordBloc
                              .get(context)
                              .newPasswordController,
                          isPassword: true),
                      SizedBox(
                        height: 18.h,
                      ),
                      AppComponents.field(
                          showPassword: showRePassword,
                          function: () {
                            if (!showRePassword) {
                              EditePasswordBloc.get(context)
                                  .add(ShowRePasswordEvent());
                            } else {
                              EditePasswordBloc.get(context)
                                  .add(DoNotShowRePasswordEvent());
                            }
                          },
                          hintText: AppStrings.rePassword,
                          controller: EditePasswordBloc
                              .get(context)
                              .rePasswordController,
                          isPassword: true),
                      SizedBox(
                        height: 18.h,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (EditePasswordBloc.get(context)
                                  .formKey
                                  .currentState!
                                  .validate() &&
                              EditePasswordBloc.get(context)
                                      .newPasswordController
                                      .text ==
                                  EditePasswordBloc.get(context)
                                      .rePasswordController
                                      .text) {
                            EditePasswordBloc.get(context).add(
                                SaveChangedPasswordEvent(
                                    currentPassword:
                                        EditePasswordBloc.get(context)
                                            .currentPasswordController
                                            .text,
                                    newPassword: EditePasswordBloc.get(context)
                                        .newPasswordController
                                        .text,
                                    rePassword: EditePasswordBloc.get(context)
                                        .rePasswordController
                                        .text));
                          } else if (EditePasswordBloc.get(context)
                                  .newPasswordController
                                  .text !=
                              EditePasswordBloc.get(context)
                                  .rePasswordController
                                  .text) {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(AppStrings.error),
                                  content: const Text(AppStrings.newPasswordNotSameRePassword),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(AppStrings.cancel))
                                  ],
                                );
                              },
                            );
                          }
                        },
                        style: AppStyles.buttonStyle.copyWith(
                            backgroundColor:
                            MaterialStatePropertyAll(AppColors.blue)),
                        child: Text(AppStrings.save, style: AppStyles.h2),
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
