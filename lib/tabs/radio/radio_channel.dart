import 'package:flutter/material.dart';

import '../../app_colors.dart';

class RadioChannel extends StatefulWidget {
  final String radioName;

  RadioChannel({super.key, required this.radioName});

  @override
  State<RadioChannel> createState() => _RadioChannelState();
}

class _RadioChannelState extends State<RadioChannel> {
  IconData heartIcon = Icons.favorite;
  IconData volumeIcon = Icons.volume_up;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 390,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryDark),
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Image.asset("assets/Images/radio_container_bg.png"),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Radio ${widget.radioName}",
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      if (heartIcon == Icons.favorite_border_outlined) {
                        heartIcon = Icons.favorite;
                      } else {
                        heartIcon = Icons.favorite_border_outlined;
                      }
                      setState(() {});
                    },
                    icon: Icon(
                      heartIcon,
                      size: 30,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_arrow,
                      size: 44,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {
                      if (volumeIcon == Icons.volume_up) {
                        volumeIcon = Icons.volume_off_rounded;
                      } else {
                        volumeIcon = Icons.volume_up;
                      }
                      setState(() {});
                    },
                    icon: Icon(
                      volumeIcon,
                      color: Colors.black,
                      size: 30,
                    )),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
