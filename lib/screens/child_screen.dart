import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavij/model/ItemModel.dart';
import 'package:lavij/screens/pics_screen.dart';

class ChildScreen extends StatelessWidget {
  const ChildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Folder folder = Get.arguments as Folder;

    return Scaffold(
      appBar: AppBar(
        title: Text(folder.title),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: folder.subchapters.length,
        separatorBuilder: (_, __) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          final child = folder.subchapters[index];
          return _buildChapterTile(child.title, child.pics);
        },
      ),
    );
  }

  Widget _buildChapterTile(String title, List<Pic> pics) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const PicViewerScreen(), arguments: pics);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
