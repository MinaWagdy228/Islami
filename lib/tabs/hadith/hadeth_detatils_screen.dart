import 'package:flutter/material.dart';
import 'package:islami/model/hadeth_model.dart';

import '../../app_colors.dart';

class HadethDetatilsScreen extends StatelessWidget {
  static const String routeName = 'hadeth_details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(color: AppColors.blackBgColor),
              child: Image.asset("assets/Images/details_bg.png")),
          Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
              Text(args.title,
                  style: const TextStyle(
                      color: AppColors.primaryDark, fontSize: 24)),
              // SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      padding: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height * 0.05),
                      itemBuilder: (context, index) {
                        return Text(args.content[index],
                            textDirection: TextDirection.rtl,
                            style: const TextStyle(
                                color: AppColors.primaryDark, fontSize: 20));
                      },
                      itemCount: args.content.length),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
