

import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {

  List<VideoPost> videos;

  VideoScrollableView({required this.videos, super.key});

  @override
  Widget build(BuildContext context) {

    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        
        final videoPost = videos[index];

        return Stack(
          children: [
            //Video player + gradiente
            SizedBox.expand(
              child: FullscreenPlayer(caption: videoPost.caption,videoUrl: videoPost.videoUrl,)
            ),
            //Botones
            Positioned( // Trabaja junto al stack y permite definir la posicion del widget hijo
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost)
            )
          ],
        );
        
      },
    );
    
    // return PageView(
    //   physics: const BouncingScrollPhysics(),
    //   scrollDirection: Axis.vertical,
    //   children: [
    //     Container(color: Colors.red ),
    //     Container( color: Colors.blue ),
    //     Container( color: Colors.yellow ),
    //     Container( color: Colors.green ),
    //     Container( color: Colors.pink ),
    //     Container( color: Colors.white ),
    //   ],
    // );
  }
}