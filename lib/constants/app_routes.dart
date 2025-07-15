import 'package:get/get.dart';
import 'package:mybook/screens/chapter_detail_screen.dart';
import 'package:mybook/screens/chapters_screen.dart';
import 'package:mybook/screens/home_screen.dart';
import 'package:mybook/screens/sub_chapters_screen.dart';

class AppRoutes {
  static const String welcome = '/';
  static const String chapters = '/chapters';
  static const String subchapters = '/subchapters';
  static const String chapterDetail = '/chapter_detail';

  static final routes = [
    GetPage(name: welcome, page: () => HomeScreen()),
    GetPage(name: chapters, page: () => ChaptersScreen()),
    GetPage(name: subchapters, page: () => const Subchaptersscreen()),
    GetPage(name: chapterDetail, page: () => Chapterdetailscreen()),
  ];
}
