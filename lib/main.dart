import 'package:e_commerce/config/routes/routes.dart';
import 'package:e_commerce/config/themeing/my_theme.dart';
import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachedData.init();
  String start;
  String? token= await CachedData.getData("token");
  if (token == null) {
    start = "/";
  } else {
    start = "home";
  }
  runApp(MyApp(start));
}

class MyApp extends StatelessWidget {
  String start;

  MyApp(this.start);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => Rout.onGenerate(settings),
        initialRoute: start,
        theme: MyTheme.light,
      ),
    );
  }
}
