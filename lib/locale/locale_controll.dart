import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLocaleController extends GetxController {
  RxString dropdownvalue = 'English'.obs;

  // List of items in our dropdown menu

  void changeLang(String codelang) {
    Locale locale = Locale(codelang);
    Get.updateLocale(locale);
  }
}
