import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/locale/locale_controll.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'homepage.dart';
import 'locale/locale.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(MyLocaleController());
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            locale: Get.deviceLocale,
            translations: MyLocale(),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'Lato',
              primarySwatch: Colors.green,
            ),
            home: Homepage(),
          );
        });
  }
}
