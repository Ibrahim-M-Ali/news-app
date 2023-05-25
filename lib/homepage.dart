import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/widgets/my_drawer-widger.dart';
import 'models/category.dart';
import 'view/category_screen.dart';

import 'widgets/category_widget.dart';

class Homepage extends StatelessWidget {
  List<CategoryPeace> category = [
    CategoryPeace(
      categoryID: "Sports".tr,
      categoryImage: "assets/images/ball.png",
      categoryTitle: "sports",
      categoryBackground: const Color.fromARGB(255, 201, 28, 34),
    ),
    CategoryPeace(
      categoryID: "Politics".tr,
      categoryImage: "assets/images/Politics.png",
      categoryTitle: "general",
      categoryBackground: const Color.fromARGB(255, 0, 62, 144),
    ),
    CategoryPeace(
      categoryID: "Health".tr,
      categoryImage: "assets/images/health.png",
      categoryTitle: "health",
      categoryBackground: const Color(0xFFED1E79),
    ),
    CategoryPeace(
      categoryID: "Business".tr,
      categoryImage: "assets/images/bussines.png",
      categoryTitle: "business",
      categoryBackground: const Color(0xFFCF7E48),
    ),
    CategoryPeace(
      categoryID: "Entertainment".tr,
      categoryImage: "assets/images/environment.png",
      categoryTitle: "entertainment",
      categoryBackground: const Color(0xFF4882CF),
    ),
    CategoryPeace(
      categoryID: "Science".tr,
      categoryImage: "assets/images/science.png",
      categoryTitle: "science",
      categoryBackground: const Color(0xFFF2D352),
    ),
  ];

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: MyDrawerWidger(),
      ),
      appBar: AppBar(
        toolbarHeight: 65.h,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        title: Text("News App".tr, style: TextStyle(fontSize: 22.sp)),
        centerTitle: true,
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
                padding: EdgeInsets.all(25.0.sp),
                child: Text(
                  // 'Pick your category \n of interest'
                  "Pick".tr,
                  style: TextStyle(
                    color: const Color(0xFF4F5A69),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 5 / 5),
                  itemCount: category.length,
                  itemBuilder: (context, index) {
                    return CategoryWidget(
                      color: category[index].categoryBackground,
                      imageUrl: category[index].categoryImage,
                      product: category[index].categoryID,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryScreen(
                                category: category[index],
                              ),
                            ));
                      },
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
