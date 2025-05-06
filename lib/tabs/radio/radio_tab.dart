import 'package:flutter/material.dart';
import 'package:islami/api/api_manager.dart';
import 'package:islami/model/radio_response_model.dart';
import 'package:islami/model/reciters_response_model.dart';
import 'package:islami/tabs/radio/radio_item.dart';
import 'package:islami/utils/app_colors.dart';

class RadioTab extends StatefulWidget {
  static const String routeName = 'home screen';

  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
//
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .035),
      child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              SizedBox(
                height: height * .02,
              ),
              Image.asset('assets/Images/bar.png'),
              SizedBox(
                height: height * .02,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xb3202020)),
                child: TabBar(
                    dividerHeight: 0,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        color: AppColors.goldColor,
                        borderRadius: BorderRadius.circular(12)),
                    labelStyle:
                        TextStyle(fontSize: 16, color: AppColors.blackColor),
                    unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.whiteColor),
                    tabs: const [
                      Tab(
                        text: 'Radio',
                      ),
                      Tab(
                        text: 'Reciters',
                      ),
                    ]),
              ),
              SizedBox(
                height: height * .02,
              ),
              Expanded(
                child: TabBarView(children: [
                  FutureBuilder<RadioResponseModel>(
                    future: ApiManager.getRadioData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.goldColor,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Column(
                          children: [
                            const Text(
                              'SomeThing went wrong',
                              style: TextStyle(color: AppColors.goldColor),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  ApiManager.getRadioData();
                                  setState(() {});
                                },
                                child: const Text('Try Again')),
                          ],
                        );
                      }
                      RadioResponseModel data = snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: data.radios!.length,
                        itemBuilder: (context, index) {
                          return RadioItem(
                            name: data.radios![index].name ?? "",
                            url: data.radios![index].url ?? "",
                          );
                        },
                      );
                    },
                  ),
                  FutureBuilder<RecitersResponseModel>(
                    future: ApiManager.getRecitersData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.goldColor,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Column(
                          children: [
                            const Text(
                              'SomeThing went wrong',
                              style: TextStyle(color: AppColors.goldColor),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  ApiManager.getRecitersData();
                                  setState(() {});
                                },
                                child: const Text('Try Again')),
                          ],
                        );
                      }
                      RecitersResponseModel data = snapshot.data!;
                      return FutureBuilder<RecitersResponseModel>(
                        future: ApiManager.getRecitersData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.goldColor,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Column(
                              children: [
                                const Text(
                                  'SomeThing went wrong',
                                  style: TextStyle(color: AppColors.goldColor),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      ApiManager.getRecitersData();
                                      setState(() {});
                                    },
                                    child: const Text('Try Again')),
                              ],
                            );
                          }
                          RecitersResponseModel data = snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: data.reciters!.length,
                            itemBuilder: (context, index) {
                              return RadioItem(
                                  name: data.reciters![index].name ?? "",
                                  url:
                                      "${data.reciters![index].moshaf![0].server}112.mp3");
                            },
                          );
                        },
                      );
                    },
                  ),
                ]),
              )
            ],
          )),
    );
  }
}
