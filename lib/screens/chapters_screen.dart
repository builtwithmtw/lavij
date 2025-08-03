import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lavij/constants/app_routes.dart';
import 'package:lavij/widgets/KurdishText.dart';
import 'package:get/get.dart';

class ChaptersScreen extends StatefulWidget {
  @override
  _ChaptersScreenState createState() => _ChaptersScreenState();
}

class _ChaptersScreenState extends State<ChaptersScreen> {
  final List<String> kurdishChapters = [
    'باب يه‌كه‌م', // 1
    'باب دووه‌م', // 2
    'باب سێیه‌م', // 3
    'باب چوارهم', // 4
    'باب پێنجه‌م', // 5
    'باب شه‌شهم', // 6
    'باب حه‌وتهم', // 7
    'باب هه‌شتهم', // 8
    'باب نۆهم', // 9
    'باب ده‌هم', // 10
    'باب یازده‌م', // 11
    'باب دوازده‌م' // 12
  ];

  late List<String> chapters;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    chapters = List.from(kurdishChapters); // copy if needed later
  }

  @override
  Widget build(BuildContext context) {
    final filteredChapters = chapters
        .where((chapter) =>
            chapter.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ── Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KurdishText(
                    text: 'كتيّب',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  IconButton(
                    icon: Icon(Icons.contact_page_outlined, size: 28),
                    onPressed: () {
                      Navigator.pushNamed(context, '/contact');
                    },
                  ),
                ],
              ),
              SizedBox(height: 12),

              /// ── Search Bar
              TextField(
                style: TextStyle(
                  fontFamily: 'AliKAlwand', // 👈 for typed text
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  hintText: '...كهران بو بابيك',
                  hintStyle: TextStyle(
                    fontFamily: 'AliKAlwand', // 👈 for placeholder/hint
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (val) {
                  setState(() => searchQuery = val);
                },
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KurdishText(
                    text: 'ناظةرؤكا ثةرتؤكيَ',
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 25),

              /// ── Grid (Scroll inside parent scroll view)
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 24,
                mainAxisSpacing: 18,
                childAspectRatio: 1.2,
                children: List.generate(filteredChapters.length, (index) {
                  return _buildChapterTile(
                    filteredChapters[index],
                    onTap: () {
                      final int chapterNo = index + 1;
                      if (chapterNo != 12) {
                        Get.toNamed(
                          AppRoutes.subchapters,
                          arguments: {'chapterId': index + 1},
                        );
                      } else {
                        Get.toNamed(AppRoutes.chapter12Detail);
                      }
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChapterTile(String title, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(0, 6),
              blurRadius: 12,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: KurdishText(
            text: title,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
