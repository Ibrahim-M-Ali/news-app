import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/settings_screen.dart';

import '../homepage.dart';
import '../view/public_search.dart';

class MyDrawerWidger extends StatelessWidget {
  const MyDrawerWidger({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Color(0xFF39A552),
          ),
          child: Center(
            child: Text(
              'News App!'.tr,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.list,
            size: 35,
            color: Colors.black,
          ),
          title: Text('Categories'.tr,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          onTap: () {
            Get.to(Homepage());
          },
        ),
        ListTile(
          leading: const Icon(
            size: 35,
            color: Colors.black,
            Icons.settings,
          ),
          title: Text('Settings'.tr,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          onTap: () {
            Get.to(SettingsScreen());
          },
        ),
        ListTile(
          leading: const Icon(
            size: 35,
            color: Colors.black,
            Icons.search,
          ),
          title: Text('Public Search'.tr,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          onTap: () {
            Get.to(const PublicSearch());
          },
        ),
      ],
    );
  }
}
