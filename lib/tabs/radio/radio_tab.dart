import 'package:flutter/material.dart';
import 'package:islami/tabs/radio/radio_channel.dart';

import '../../app_colors.dart';

class RadioTab extends StatelessWidget {
  static const String routeName = 'radio_tab';

  List<String> radioNames = [
    'Ibrahim Al-Akadar',
    'Al-Qaria Yassen',
    'Ahmed Al-trabulsi',
    'Adokali Mohammed Alalim'
  ];

  IconData heartIcon = Icons.favorite;

  IconData volumeIcon = Icons.volume_up;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.2),
          child: Image.asset("assets/Images/Logo.png")),
      body: Column(
        children: [
          DefaultTabController(
              length: 2,
              child: TabBar(
                  indicatorColor: Colors.transparent,
                  unselectedLabelStyle: const TextStyle(color: Colors.white),
                  labelStyle: const TextStyle(color: Colors.black),
                  indicator: BoxDecoration(
                      color: AppColors.primaryDark,
                      borderRadius: BorderRadius.circular(12)),
                  tabs: [
                    Container(
                      alignment: Alignment.center,
                      width: 184,
                      height: 40,
                      child: const Text(
                        "Radio",
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 184,
                      height: 40,
                      child: const Text(
                        "Reciters",
                      ),
                    ),
                  ])),
          Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) =>
                      RadioChannel(radioName: radioNames[index]),
                  itemCount: radioNames.length))
        ],
      ),
    );
  }
}
