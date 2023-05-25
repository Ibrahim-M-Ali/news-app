import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/locale/locale_controll.dart';
import 'package:news_app/widgets/my_drawer-widger.dart';

class SettingsScreen extends StatelessWidget {
  final MyLocaleController controller = Get.put(MyLocaleController());

  SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var items = [
      'English',
      'Arabic',
    ];
    return Scaffold(
      drawer: const Drawer(child: MyDrawerWidger()),
      appBar: AppBar(
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        centerTitle: true,
        title: Text("Settings".tr, style: const TextStyle(fontSize: 22)),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/pattern.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Language".tr,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(() => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: const Color(0xFF39A552))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton(
                          isExpanded: true,
                          style: const TextStyle(color: Color(0xFF39A552)),
                          borderRadius: BorderRadius.circular(10),
                          value: controller.dropdownvalue.value,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF39A552),
                          ),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            if (newValue == "English") {
                              controller.changeLang("en");
                              controller.dropdownvalue.value =
                                  newValue.toString();
                            } else {
                              controller.dropdownvalue.value =
                                  newValue.toString();
                              controller.changeLang("ar");
                            }
                            //   dropdownvalue = newValue!;
                          },
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
