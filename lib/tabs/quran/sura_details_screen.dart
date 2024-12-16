import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/sura_model.dart';
import 'package:islami/tabs/quran/sura_content_item.dart';

import '../../app_colors.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const routeName = 'sure_details_screen';
  static int selectedIndex = -1;

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    final SuraModel args =
        ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(args.fileName);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(args.englishSuraName,
            style: const TextStyle(color: AppColors.primaryDark)),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
              decoration: const BoxDecoration(color: AppColors.blackBgColor),
              child: Image.asset("assets/Images/details_bg.png")),
          Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
              Text(args.arabicSuraName,
                  style: const TextStyle(
                      color: AppColors.primaryDark, fontSize: 24)),
              // SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
              Expanded(
                child: verses.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primaryDark,
                      ))
                    : ListView.builder(
                        padding: EdgeInsets.only(
                            top: MediaQuery.sizeOf(context).height * 0.05),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              SuraDetailsScreen.selectedIndex = index + 1;
                              setState(() {});
                            },
                            onDoubleTap: () {
                              SuraDetailsScreen.selectedIndex = -1;
                              setState(() {});
                            },
                            child: SuraContentItem(
                              content: verses[index],
                              index: index + 1,
                            ),
                          );
                        },
                        itemCount: verses.length),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> loadSuraFile(String fileName) async {
    String suraContent =
        await rootBundle.loadString('assets/files/Suras/$fileName'
            // '${index + 1}.txt'
            );
    List<String> suraLines = suraContent.split("\n");
    verses = suraLines;
    setState(() {});
  }
}
