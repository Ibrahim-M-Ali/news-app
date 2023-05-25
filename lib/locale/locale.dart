import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "1": "الصفحة الرئيسية",
          "Politics": "السيـاسة",
          "Sports": "الرياضة",
          "Health": "الصحة",
          "Business": "الإقتصاد",
          "Science": "العلوم",
          "Entertainment": "الترفية",
          "News App": "تطبيق الأخبار",
          "Pick": "قم باختيار تصنيف الأخبار",
          "News App!": "تطبيق الأخبار!",
          "Categories": "الأقسام",
          "Settings": "الإعدادات",
          "Language": "اللغات",
          "Public Search": "البحث العام",
          "Please Enter a title of news": "قم بإدخال موضوع البحث",
          "Search Here": "ابحث هنا",
          "News Title": "محتوى الخبر",
        },
        "en": {
          "1": "HomePage",
          "Politics": "Politics",
          "Sports": "Sports",
          "Health": "Health",
          "Business": "Business",
          "Science": "Science",
          "Entertainment": "Entertainment",
          "News App": "News App",
          "Pick": "Pick your category \n of interest",
          "News App!": "News App!",
          "Categories": "Categories",
          "Settings": "Settings",
          "Language": "Language",
          "Public Search": "Public Search",
          "Please Enter a title of news": "Please Enter a title of news",
          "Search Here": "Search Here",
          "News Title": "News Title",
        },
      };
}
