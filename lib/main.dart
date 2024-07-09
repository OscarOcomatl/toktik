import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infraestructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infraestructure/repositories/video_posts_repository_impl.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build( BuildContext context ){

    final videoPostRepository = VideoPostsRepositoryImpl(
      videosDatasource: LocalVideoDataSource()
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false, // Inmediatamente se cree la referencia
          create: (_) => DiscoverProvider(videosRepository: videoPostRepository)..loadNextPage() // Objeto()..metodo()
        ), 
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        title: 'TokTik',
        home: const Scaffold(
          // appBar: AppBar(
          //   title:  const Text('TokTik'),
          //   centerTitle: true,
          // ),
          body: DiscoverScreen()
        ),
      ),
    );
  }
}