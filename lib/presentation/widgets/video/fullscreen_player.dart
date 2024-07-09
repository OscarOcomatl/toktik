import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullscreenPlayer extends StatefulWidget {

  final String videoUrl;
  final String caption;

  const FullscreenPlayer({required this.videoUrl, required this.caption});

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {

  late VideoPlayerController controller;

    @override
  void initState() {
    
    super.initState();

    controller = VideoPlayerController.asset( widget.videoUrl )
      ..setVolume(0) // Establecer volumen en cero
      ..setLooping(true) // Establecer que se siga reproduciendo
      ..play(); // Que inicie reproduciendose
  }
    
    @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // widget.caption /* De esta forma se puede acceder a los argumentos */
    // widget.videoUrl

    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {

        if(snapshot.connectionState != ConnectionState.done){
          return const Center(child: CircularProgressIndicator(strokeWidth: 2,));
        }

        return GestureDetector(
          onTap: () {
            if(controller.value.isPlaying){
              controller.pause();
              return;
            }
            controller.play();
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio, // el aspecto se define al aspectRadio del video
            child: Stack(
              children: [
                VideoPlayer(controller),
                // Gradiente
                VideoBackground(
                  stops: const [ 0.8, 1.0 ],
                ),
                //Texto
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption)
                )
              ],
            )
          ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {

  final String caption;

  const _VideoCaption({required this.caption, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(caption, maxLines: 2, style:titleStyle ),
    );
  }
}