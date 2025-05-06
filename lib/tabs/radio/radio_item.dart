import 'package:flutter/material.dart';
import 'package:islami/provider/radio_manager_provider.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:provider/provider.dart';

class RadioItem extends StatefulWidget {
  String name;
  String url;

  RadioItem({required this.name, required this.url});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isVolumeUp = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Consumer<RadioManagerProvider>(
      builder: (context, RadioManagerProvider provider, child) {
        return Container(
          height: height * .15,
          // padding: EdgeInsets.only(top: height * .02),
          margin: EdgeInsets.only(bottom: height * .015),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage('assets/Images/radio_back_nv1.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      provider.play(widget.url);
                    },
                    icon: Icon(
                      (provider.isPlaying &&
                              provider.currentPlayingUrl == widget.url)
                          ? Icons.pause
                          : Icons.play_circle,
                      color: AppColors.blackColor,
                      size: 35,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (provider.currentPlayingUrl == widget.url) {
                        provider.stop();
                      }
                    },
                    icon: Icon(
                      Icons.stop_circle_outlined,
                      color: AppColors.blackColor,
                      size: 35,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      isVolumeUp = !isVolumeUp;
                      provider.setVolume(isVolumeUp ? 2.0 : 0.0);
                      setState(() {});
                    },
                    icon: Icon(
                      isVolumeUp ? Icons.volume_up_rounded : Icons.volume_off,
                      color: AppColors.blackColor,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
