import 'package:flutter/material.dart';

class DetailsText extends StatelessWidget {
  const DetailsText({super.key, required this.movieDetail, required this.title, this.isRow = false});

  final String title;
  final String movieDetail;
  final bool isRow;

  @override
  Widget build(BuildContext context) {
    if (isRow) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              movieDetail,
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              movieDetail,
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
            ),
          ],
        ),
      );
    }
  }
}
