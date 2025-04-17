import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget sectionTitle({
  required String title,
  double? gradientWidth,
  double? sectionTitleSize,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, top: 12),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: sectionTitleSize ?? 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 5),
        Container(
          width: gradientWidth ?? 60,
          height: gradientWidth == null ? 2 : 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black26, Colors.black12.withAlpha(10)],
            ),
          ),
        ),
      ],
    ),
  );
}
