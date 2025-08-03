import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:lavij/constants/app_routes.dart';
import 'package:lavij/model/TableOfContent.dart';
import 'package:lavij/widgets/KurdishText.dart';

class TableOfContentScreen extends StatefulWidget {
  const TableOfContentScreen({super.key});

  @override
  State<TableOfContentScreen> createState() => _TableOfContentScreenState();
}

class _TableOfContentScreenState extends State<TableOfContentScreen> {
  List<TableOfContent> chapters = [];

  @override
  void initState() {
    super.initState();
    loadTableOfContent();
  }

  Future<void> loadTableOfContent() async {
    final jsonString =
        await rootBundle.loadString('assets/table_of_content.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);

    setState(() {
      chapters = jsonList
          .map((jsonItem) => TableOfContent.fromJson(jsonItem))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: KurdishText(
        text: 'ناظةرؤكا ثةرتؤكيَ',
        fontSize: 24,
        color: Colors.black,
      )),
      body: chapters.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: chapters.length,
              itemBuilder: (context, index) {
                final chapter = chapters[index];
                final chapterNo = index + 1;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: _buildChapterTile(
                    chapter.title,
                    onTap: () {
                      if (chapterNo != 12) {
                        Get.toNamed(
                          AppRoutes.subchapters,
                          arguments: {'chapterId': chapterNo},
                        );
                      } else {
                        Get.toNamed(AppRoutes.chapter12Detail);
                      }
                    },
                  ),
                );
              },
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: KurdishText(
              text: title,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
