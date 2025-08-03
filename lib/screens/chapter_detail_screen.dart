import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lavij/widgets/KurdishText.dart';

class Chapterdetailscreen extends StatelessWidget {
  const Chapterdetailscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Extracting arguments
    final Map<String, dynamic> args = Get.arguments ?? {};
    final String title = args['title'] ?? '';
    final String content = args['content'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: KurdishText(
          text: title,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KurdishText(
                text: content,
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black87,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
