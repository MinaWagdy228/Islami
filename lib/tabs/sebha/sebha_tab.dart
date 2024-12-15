import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';

class SebhaTab extends StatefulWidget {
  static const String routeName = 'sebha_tab';

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
    "لا حول ولا قوة إلا بالله"
  ];
  double turns = 0;
  int counter = 0;
  int currentZekr = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/Images/Logo.png"),
        const SizedBox(height: 30),
        const Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
            textDirection: TextDirection.rtl,
            style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/Images/head_of_sebha.png"),
              Stack(alignment: Alignment.center, children: [
                AnimatedRotation(
                    duration: const Duration(milliseconds: 500),
                    turns: turns,
                    child: Center(
                        child: GestureDetector(
                            onTap: () {
                              turns += 1 / 30;
                              counter++;
                              if (counter % 33 == 0) {
                                currentZekr++;
                              }
                              setState(() {});
                            },
                            child:
                                Image.asset("assets/Images/sebha_body.png")))),
                Text(azkar[currentZekr % 5],
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text("$counter",
                      style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                )
              ]),
            ],
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(AppColors.primaryDark)),
              onPressed: () {
                counter = 0;
                currentZekr = 0;
                setState(() {});
              },
              child: const Text("Reset Azkar",
                  style: TextStyle(color: AppColors.whiteColor))),
        )
      ],
    );
  }
}
