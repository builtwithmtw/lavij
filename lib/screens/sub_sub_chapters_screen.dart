import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:lavij/constants/app_routes.dart';
import 'package:lavij/widgets/KurdishText.dart';
import 'package:lavij/model/ChapterModel.dart'; // import model

class Subsubchaptersscreen extends StatefulWidget {
  const Subsubchaptersscreen({super.key});

  @override
  State<Subsubchaptersscreen> createState() => _SubsubchaptersscreenState();
}

class _SubsubchaptersscreenState extends State<Subsubchaptersscreen> {
  late int chapterId;
  late String title;
  Chapter? chapter;
  Subchapter? selectedSubChapter;

  @override
  void initState() {
    super.initState();
    chapterId = Get.arguments['chapterId'];
    title = Get.arguments['title'];
    loadChapter(chapterId, title);
  }

  Future<void> loadChapter(int id, String title) async {
    print("Loading chapter with ID: $id");
    final jsonString = await rootBundle.loadString('assets/chapter${id}.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);
    final chapterData = Chapter.fromJson(jsonList[0]);

    final subchapter = chapterData.subchapters.firstWhere(
      (s) => s.title == title,
      orElse: () => Subchapter(title: '', content: ''),
    );

    setState(() {
      chapter = chapterData;
      selectedSubChapter = subchapter;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (chapter == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Loading...")),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(selectedSubChapter!.title,
              style: TextStyle(
                fontFamily: "Rudaw-Regular",
              ))),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: selectedSubChapter!.subchapters.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 24,
            mainAxisSpacing: 18,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            final sub = selectedSubChapter!.subchapters[index];
            return _buildSubChapterTile(sub);
          },
        ),
      ),
    );
  }

  Widget _buildSubChapterTile(Subchapter subchapter) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.chapterDetail, arguments: {
          'title': subchapter.title,
          'content': subchapter.content,
        });
      },
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: KurdishText(
              text: subchapter.title,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
