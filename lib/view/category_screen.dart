import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:intl/intl.dart';
import '../api/api-services.dart';
import '../models/category.dart';
import '../widgets/my_drawer-widger.dart';
import 'full-article.dart';
import '../widgets/news_widget.dart';

class CategoryScreen extends StatefulWidget {
  CategoryPeace category;

  CategoryScreen({
    super.key,
    required this.category,
  });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController textController = TextEditingController();
  String search = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: MyDrawerWidger()),
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(10.0.sp),
            child: SearchBarAnimation(
              searchBoxWidth: 300.w,
              buttonColour: Colors.green,
              hintTextColour: const Color(0xFF39A552),
              buttonElevation: 0,
              enableKeyboardFocus: true,
              onFieldSubmitted: null,
              enableButtonShadow: false,
              isSearchBoxOnRightSide: true,
              trailingWidget: InkWell(
                onTap: () {
                  setState(() {
                    textController.clear();
                    search = "";
                  });
                },
                child: const Icon(
                  Icons.close,
                  color: Color(0xFF39A552),
                ),
              ),
              secondaryButtonWidget: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
              textEditingController: textController,
              isOriginalAnimation: false,
              buttonBorderColour: Colors.black45,
              buttonWidget: const Icon(
                Icons.search,
                size: 40,
              ),
              onChanged: (value) {
                setState(() {
                  search = value;
                });
              },
            ),
          ),
        ],
        toolbarHeight: 65.h,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        centerTitle: true,
        title: Text(widget.category.categoryID),
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        FutureBuilder(
          future: ApiServices.getNews(widget.category.categoryTitle),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                  child:
                      Text('Error loading data${snapshot.error.toString()}'));
            }
            if (snapshot.data!.status == 'error') {
              return Center(
                  child: Text('Server Error ${snapshot.data?.message}'));
            }
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1,
                    width: 50.w,
                    color: Colors.grey[400],
                  );
                },
                itemCount: snapshot.data!.articles!.length,
                itemBuilder: (context, index) {
                  String? mydate = snapshot.data!.articles![index].publishedAt;
                  final dateFormate =
                      DateFormat("jm").format(DateTime.parse(mydate!));

                  if (search.isEmpty) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullArticle(
                                  publishedAt: dateFormate,
                                  imgURl: snapshot
                                          .data!.articles![index].urlToImage ??
                                      "https://t3.ftcdn.net/jpg/03/27/55/60/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg",
                                  source: snapshot.data!.articles![index]
                                          .source!.name ??
                                      "",
                                  description:
                                      snapshot.data!.articles![index].title ??
                                          "",
                                  fullArticle: snapshot.data!.articles![index]
                                          .testFullArticle ??
                                      "There is No Contenttt"),
                            ));
                      },
                      child: NewsWidget(
                        imgUrl: snapshot.data!.articles![index].urlToImage ??
                            "https://t3.ftcdn.net/jpg/03/27/55/60/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg",
                        descText: snapshot.data!.articles![index].title ?? "",
                        soruceText:
                            snapshot.data!.articles![index].author ?? "",
                        newsTime: dateFormate,
                      ),
                    );
                  }

                  if (snapshot.data!.articles![index].title!
                      .toLowerCase()
                      .contains(search.toLowerCase())) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullArticle(
                                  publishedAt: dateFormate,
                                  imgURl: snapshot
                                          .data!.articles![index].urlToImage ??
                                      "https://t3.ftcdn.net/jpg/03/27/55/60/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg",
                                  source: snapshot.data!.articles![index]
                                          .source!.name ??
                                      "",
                                  description:
                                      snapshot.data!.articles![index].title ??
                                          "",
                                  fullArticle: snapshot
                                      .data!.articles![index].testFullArticle!),
                            ));
                      },
                      child: NewsWidget(
                        imgUrl: snapshot.data!.articles![index].urlToImage ??
                            "https://t3.ftcdn.net/jpg/03/27/55/60/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg",
                        descText: snapshot.data!.articles![index].title ?? "",
                        soruceText:
                            snapshot.data!.articles![index].author ?? "",
                        newsTime: dateFormate,
                      ),
                    );
                  }
                  return null;
                },
              ),
            );
          }),
        ),
      ]),
    );
  }
}
