import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/core/utils/app_constants.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/featuers/home/presentation/bloc/home_bloc.dart';
import 'package:e_commerce/featuers/home/presentation/pages/components/edit_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';

class AccountTab extends StatelessWidget {
  bool currentPasswordShown;

  bool rePasswordShown;

  bool newPasswordShown;

  AccountTab(
      {required this.currentPasswordShown,
      required this.rePasswordShown,
      required this.newPasswordShown});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditField(
              title: AppStrings.yourFullName,
              content: AppConstants.userName ?? "",
              onEditIconTab: () {
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Padding(
                        padding: EdgeInsets.all(18.0.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppStrings.enterNewName,
                              style: AppStyles.h2.copyWith(color: Colors.black),
                            ),
                            SizedBox(
                              height: 18.h,
                            ),
                            TextFormField(
                              controller: HomeBloc.get(context).nameController,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value == "") {
                                  return AppStrings.pleaseEnterName;
                                }
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.r)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.r))),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (HomeBloc.get(context)
                                      .formKey
                                      .currentState!
                                      .validate()) {
                                    print(
                                        "HomeBloc.get(context).formKey.currentState!.validate() = ${HomeBloc.get(context).formKey.currentState!.validate()}");
                                    print(HomeBloc.get(context)
                                        .nameController
                                        .text);
                                  } else {
                                    print("no");
                                  }
                                },
                                child: Text(
                                  AppStrings.done,
                                  style: AppStyles.titleProductStyle
                                      .copyWith(fontWeight: FontWeight.w700),
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
          EditField(
              title: AppStrings.yourEmail,
              content: AppConstants.email ?? "",
              onEditIconTab: () {
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Padding(
                        padding: EdgeInsets.all(18.0.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppStrings.enterNewName,
                              style: AppStyles.h2.copyWith(color: Colors.black),
                            ),
                            SizedBox(
                              height: 18.h,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.r)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(18.r))),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouts.editePassword);
              },
              child: const Align(
                  alignment: Alignment.center,
                  child: Text(AppStrings.changePassword)))
        ],
      ),
    );
  }
}
