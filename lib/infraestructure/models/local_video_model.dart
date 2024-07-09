


import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {

  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0
  });

  // Para cuando se recibe la info de un json de una peticion http
  factory LocalVideoModel.fromJson(Map<String, dynamic> json) => LocalVideoModel(
    name: json["name"] ?? 'No name',
    videoUrl: json["videoUrl"],
    likes: json["likes"] ?? 0,
    views: json["views"] ?? 0
  );

  Map<String,dynamic> toMap() => {
    "name" : name,
    "videoUrl":videoUrl,
    "likes":likes,
    "views":views
  };

  VideoPost toVideoPostEntity() => VideoPost(
    caption: name, 
    videoUrl: videoUrl,
    likes: likes,
    views: views
  );
}


// class VideoPost {

//   final String caption;
//   final String videoUrl;
//   final int likes;
//   final int views;

//   VideoPost({
//     required this.caption,
//     required this.videoUrl,
//     this.likes = 0,
//     this.views = 0
//   });
// }