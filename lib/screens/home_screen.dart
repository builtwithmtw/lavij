import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybook/constants/app_routes.dart';
import 'package:mybook/widgets/KurdishText.dart';
import 'package:mybook/widgets/author.dart';
import 'package:mybook/widgets/book_cover.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // add shadow to the image
          Author(),
          SizedBox(height: 20),
          BookCover(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                KurdishText(
                    text: 'ناونيشانى كتيّب',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                SizedBox(height: 10),
                KurdishText(
                  text: 'مؤسائه سعهد ئيبراهيم',
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: KurdishText(
                    text: 'ده ستيى بكه بو خويندن',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  onPressed: () {
                    Get.toNamed(AppRoutes.chapters);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    foregroundColor:
                        Colors.white, // ✅ this sets the text/icon color
                    padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
