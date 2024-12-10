import 'package:flutter/material.dart';

class SuraListWidget extends StatelessWidget {
  final int index;
  final String englishQuranSurah;
  final String ayaNumber;
  final String arabicQuranSura;

  const SuraListWidget(
      {super.key,
      required this.index,
      required this.englishQuranSurah,
      required this.ayaNumber,
      required this.arabicQuranSura});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("assets/Images/vector_image.png"),
                Text(
                  "$index",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.058,
              // width: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  englishQuranSurah,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  "$ayaNumber Verses",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            ),
          ],
        ),
        Text(
          arabicQuranSura,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}
