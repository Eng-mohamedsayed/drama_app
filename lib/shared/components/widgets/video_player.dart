import 'package:drama/shared/styles/colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  YoutubePlayerController? controller;
  VideoPlayerScreen({Key? key, @required this.controller}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState(controller);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  YoutubePlayerController? controller;
  _VideoPlayerScreenState(this.controller);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.mainColor,
      body: Stack(
        children: [
          Center(

            child: controller!=null?
            YoutubePlayer(
              controller: controller!,
            ): const Image(image: NetworkImage(
                        'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png')) ,
          ),
          Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    EvaIcons.closeCircle,
                    color: Colors.white,
                  )),

                  
                  ),
        ],
      ),
    );
  }
}
