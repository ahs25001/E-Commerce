import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/featuers/home/presentation/widgets/account_tab.dart';
import 'package:e_commerce/featuers/home/presentation/widgets/catrgries_tab.dart';
import 'package:e_commerce/featuers/home/presentation/widgets/favorets_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/home_bloc.dart';
import '../widgets/home_tab.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()
        ..add(GetCategoryEvent())
        ..add(GEtBrandsEvent()),
      child: SafeArea(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.homeScreenStatus == HomeScreenStatus.loading) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => const AlertDialog(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Center(
                      child: CircularProgressIndicator(
                    color: Colors.red,
                  )),
                ),
              );
            } else if (state.homeScreenStatus ==
                    HomeScreenStatus.getBrandsSuccessfully ||
                state.homeScreenStatus ==
                    HomeScreenStatus.getCategorySuccessfully) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            List<Widget> tabs = [
              HomeTab(state.categoryEntity, state.brandsEntity),
              const CategoriesTab(),
              const FavoritesTab(),
              const AccountTab()
            ];
            return Scaffold(
              extendBody: true,
              bottomNavigationBar: ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: BottomNavigationBar(
                    currentIndex: state.index ?? 0,
                    // selectedIconTheme: IconThemeData(color: ),
                    type: BottomNavigationBarType.fixed,
                    onTap: (value) {
                      HomeBloc.get(context).add(ChangeTabEvent(value));
                    },
                    selectedIconTheme: const IconThemeData(color: Colors.black),
                    unselectedIconTheme:
                        const IconThemeData(color: Colors.white),
                    backgroundColor: AppColors.blue,
                    items: const [
                      BottomNavigationBarItem(
                          activeIcon: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 17,
                              ),
                              Icon(Icons.home_filled)
                            ],
                          ),
                          icon: Icon(Icons.home_filled),
                          label: ""),
                      BottomNavigationBarItem(
                          activeIcon: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 17,
                              ),
                              Icon(Icons.category)
                            ],
                          ),
                          icon: Icon(Icons.category),
                          label: ""),
                      BottomNavigationBarItem(
                          activeIcon: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 17,
                              ),
                              Icon(Icons.favorite_border)
                            ],
                          ),
                          icon: Icon(Icons.favorite_border),
                          label: ""),
                      BottomNavigationBarItem(
                          activeIcon: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 17,
                              ),
                              Icon(Icons.person)
                            ],
                          ),
                          icon: Icon(Icons.person),
                          label: ""),
                    ]),
              ),
              body: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppImages.routLogoAppBar,
                      width: 76.w,
                      height: 32.h,
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                              textInputAction: TextInputAction.search,
                              decoration: InputDecoration(
                                hintText: AppStrings.searchHint,
                                prefixIconColor: AppColors.blue,
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.search),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8.h, horizontal: 5.w),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.r),
                                    borderSide:
                                        BorderSide(color: AppColors.blue)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide:
                                        BorderSide(color: AppColors.blue)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide:
                                        BorderSide(color: AppColors.blue)),
                              )),
                        ),
                        SizedBox(
                          width: 24.w,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.shopping_cart))
                      ],
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    tabs[state.index ?? 0]
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
