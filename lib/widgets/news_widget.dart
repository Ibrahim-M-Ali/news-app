// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsWidget extends StatelessWidget {
  String imgUrl;
  String soruceText;
  String descText;
  String newsTime;
  NewsWidget({
    super.key,
    required this.imgUrl,
    required this.soruceText,
    required this.descText,
    required this.newsTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imgUrl,
            height: 180.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                color: Colors.black,
                child: Text(
                  soruceText,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            descText,
            style: TextStyle(fontSize: 14.sp),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              newsTime,
              style: TextStyle(
                color: const Color(0xFFA3A3A3),
                fontSize: 12.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
