// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FullArticle extends StatefulWidget {
  String imgURl;
  String source;
  String description;
  String fullArticle;
  String publishedAt;

  FullArticle({
    super.key,
    required this.imgURl,
    required this.source,
    required this.description,
    required this.fullArticle,
    required this.publishedAt,
  });

  @override
  State<FullArticle> createState() => _FullArticleState();
}

class _FullArticleState extends State<FullArticle> {
  bool expandFullArticle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Content Title'.tr,
          style: TextStyle(fontSize: 22.sp),
        ),
        centerTitle: true,
        toolbarHeight: 65.h,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
      ),
      //aa
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    widget.imgURl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.black,
                    child: Text(
                      widget.source,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.description,
                    style: const TextStyle(
                        fontSize: 17,
                        color: Color(0xFF42505C),
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.publishedAt,
                        style: const TextStyle(color: Color(0xFFA3A3A3)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.white,
                    child: Text(
                      maxLines: expandFullArticle == true ? 14 : null,
                      widget.fullArticle,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Color(0xFF42505C),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      print(expandFullArticle);
                      setState(() {
                        expandFullArticle = !expandFullArticle;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          expandFullArticle == true
                              ? 'View Full Article'
                              : 'Collapse Article',
                          style: const TextStyle(
                              color: Color(0xFF42505C),
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        expandFullArticle == true
                            ? const Icon(Icons.arrow_drop_down)
                            : const Icon(Icons.arrow_drop_up),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
