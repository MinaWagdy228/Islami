import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';
import 'package:islami/tabs/quran/sura_list_widget.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/sura_model.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  void addSuraList() {
    for (var i = 0; i < 114; i++) {
      SuraModel.suraList.add(SuraModel(
          englishSuraName: SuraModel.englishQuranSurahs[i],
          arabicSuraName: SuraModel.arabicQuranSuras[i],
          numOfVerses: SuraModel.ayaNumber[i],
          index: i + 1));
    }
  }

  @override
  void initState() {
    addSuraList();
    loadLastSura();
    super.initState();
  }

  String searchText = '';
  List<SuraModel> filteredList = SuraModel.suraList;
  Map<String, String> lastSura = {};
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/Images/Logo.png"),
          TextField(
              style: const TextStyle(color: Colors.white),
              onChanged: (text) {
                searchText = text;
                filteredList = SuraModel.suraList
                    .where((element) =>
                        element.englishSuraName
                            .toLowerCase()
                            .trim()
                            .contains(searchText.toLowerCase().trim()) ||
                        element.arabicSuraName
                            .trim()
                            .contains(searchText.trim()))
                    .toList();
                setState(() {});
              },
              cursorColor: Colors.white,
              decoration: InputDecoration(
                  hintText: "Sura Name",
                  hintStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: AppColors.primaryDark, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: AppColors.primaryDark, width: 2)),
                  prefixIcon: const ImageIcon(
                      color: AppColors.primaryDark,
                      AssetImage("assets/Images/icon_search.png")))),
          SizedBox(height: height * 0.02),
          searchText.isEmpty && lastSura['suraEnName'] != ''
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
                        arguments: filteredList[int.parse(lastSura['index']!)]);
                  },
                  child: buildMostRecently(height))
              : const SizedBox(),
          const SizedBox(height: 10),
          const Text("Sura List",
              style: TextStyle(color: AppColors.whiteColor)),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: ()
                        // async
                        {
                      // await
                      saveLastSura(
                          suraEnName: filteredList[index].englishSuraName,
                          suraArName: filteredList[index].arabicSuraName,
                          numberOfVerses: filteredList[index].numOfVerses,
                          index: (filteredList[index].index - 1).toString());
                      // await loadLastSura();
                      Navigator.of(context).pushNamed(
                          SuraDetailsScreen.routeName,
                          arguments: filteredList[index]
                          // SuraModel.getSuraModel(index)
                          );
                    },
                    child: SuraListWidget(
                        index: index, //new added in the constructor
                        suraModel: filteredList[index]
                        // SuraModel.getSuraModel(index)
                        ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                    indent: width * 0.12,
                    endIndent: width * 0.12,
                    thickness: 2),
                itemCount: filteredList.length),
          )
        ],
      ),
    );
  }

  Widget buildMostRecently(double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Most Recently",
          style: AppStyles.bold16White,
        ),
        SizedBox(height: height * 0.015),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lastSura['suraEnName'] ?? '',
                      style: AppStyles.bold24Black),
                  Text(lastSura['suraArName'] ?? '',
                      style: AppStyles.bold24Black),
                  Text('${lastSura['numberOfVerses'] ?? ''} verses',
                      style: AppStyles.bold14Black),
                ],
              ),
              Image.asset("assets/Images/most_recent_image.png")
            ],
          ),
        )
      ],
    );
  }

  Future<void> saveLastSura(
      {required String suraEnName,
      required String suraArName,
      required String numberOfVerses,
      required String index}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('suraEnName', suraEnName);
    await prefs.setString('suraArName', suraArName);
    await prefs.setString('numberOfVerses', numberOfVerses);
    await prefs.setString('index', index);
    await loadLastSura();
  }

  Future<Map<String, String>> getLastSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String suraEnName = prefs.getString("suraEnName") ?? '';
    String suraArName = prefs.getString("suraArName") ?? '';
    String numberOfVerses = prefs.getString("numberOfVerses") ?? '';
    String index = prefs.getString('index') ?? '-1';
    return {
      'suraEnName': suraEnName,
      'suraArName': suraArName,
      'numberOfVerses': numberOfVerses,
      'index': index
    };
  }

  loadLastSura() async {
    lastSura = await getLastSura();
    setState(() {});
  }
}
