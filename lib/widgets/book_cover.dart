import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  const BookCover({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 5,
            offset: Offset(0, 4), // shadow direction: bottom right
          ),
        ],
      ),
      child: Image.asset(
        'assets/book_cover.jpeg',
        width: 280,
        height: 400,
        fit: BoxFit.cover,
      ),
    );
  }
}
