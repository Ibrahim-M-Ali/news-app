import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

import '../api/pp_search.dart';
import '../widgets/my_drawer-widger.dart';
import '../widgets/news_widget.dart';
import 'full-article.dart';

class PublicSearch extends StatefulWidget {
  const PublicSearch({super.key});

  @override
  State<PublicSearch> createState() => _PublicSearchState();
}

class _PublicSearchState extends State<PublicSearch> {
  TextEditingController textController = TextEditingController();
  String search = "";
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: MyDrawerWidger()),
      appBar: AppBar(
        title: Text('Public Search'.tr),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: key,
              child: SearchBarAnimation(
                hintText: "Search Here".tr,
                durationInMilliSeconds: 500,
                textAlignToRight: true,
                searchBoxWidth: 300.w,
                buttonColour: Colors.green,
                hintTextColour: const Color(0xFF39A552),
                buttonElevation: 0,
                enableKeyboardFocus: true,
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
                onEditingComplete: () {
                  setState(() {});
                  key.currentState!.save();
                },
                textEditingController: textController,
                isOriginalAnimation: false,
                buttonBorderColour: Colors.black45,
                buttonWidget: const Icon(
                  Icons.search,
                  size: 40,
                ),
                onSaved: (val) {
                  search = val;
                },
              ),
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
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/pattern.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          FutureBuilder(
            future: AllnewsServices.getAllNews(search),
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
                return Center(child: Text('Please Enter a title of news'.tr));
              }
              return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 1,
                        width: 50,
                        color: Colors.grey[400],
                      );
                    },
                    itemCount: snapshot.data!.articles!.length,
                    itemBuilder: (context, index) {
                      String? mydate =
                          snapshot.data!.articles![index].publishedAt;
                      final dateFormate =
                          DateFormat("jm").format(DateTime.parse(mydate!));
                      if (search.isEmpty) {
                        return const Center(
                          child: Text('Please Enter a title of news'),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullArticle(
                                    publishedAt: dateFormate,
                                    imgURl: snapshot.data!.articles![index]
                                            .urlToImage ??
                                        "https://t3.ftcdn.net/jpg/03/27/55/60/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg",
                                    source: snapshot.data!.articles![index]
                                            .source!.name ??
                                        "",
                                    description:
                                        snapshot.data!.articles![index].title ??
                                            "",
                                    fullArticle: snapshot.data!.articles![index]
                                            .testFullArticle ??
                                        '',
                                  ),
                                ));
                          },
                          child: NewsWidget(
                            imgUrl: snapshot
                                    .data!.articles![index].urlToImage ??
                                "https://t3.ftcdn.net/jpg/03/27/55/60/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg",
                            descText:
                                snapshot.data!.articles![index].title ?? "",
                            soruceText:
                                snapshot.data!.articles![index].author ?? "",
                            newsTime: dateFormate,
                          ),
                        );
                      }
                    },
                  ));
            }),
          ),
        ],
      ),
    );
  }
}
