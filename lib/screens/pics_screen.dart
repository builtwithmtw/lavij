import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavij/model/ItemModel.dart';
import 'package:lavij/widgets/KurdishText.dart';

class PicViewerScreen extends StatelessWidget {
  const PicViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Pic> pics = Get.arguments as List<Pic> ?? [];

    return Scaffold(
      appBar: AppBar(
          title: const KurdishText(
        text: "وێنەکان",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      )),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: pics.length,
        separatorBuilder: (_, __) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          final pic = pics[index];
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (pic.title.isNotEmpty)
                  Text(
                    pic.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                const SizedBox(height: 8),
                if (pic.path.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      pic.path,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.broken_image),
                    ),
                  )
                else
                  const Text('No image path provided'),
              ],
            ),
          );
        },
      ),
    );
  }
}
