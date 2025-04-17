import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget itemCategory({
  required Color color,
  required String image,
  required String title,
  double? imageWidth,
  double? height,
  double? width,
}) {
  return Column(
    children: [
      Container(
        width: width ?? 61,
        height: height ?? 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(1, 3),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            image,
            fit: BoxFit.contain,
            width: imageWidth ?? 50,
          ),
        ),
      ),
      const SizedBox(height: 5),
      Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12),
      ),
    ],
  );
}
