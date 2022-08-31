import 'package:flutter/material.dart';
import 'package:flutter_app_dicoding/features/home/home.dart';

class MovieImage extends StatelessWidget {
  final MovieResult movie;

  const MovieImage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: movie.posterPath == null
              ? const Icon(Icons.movie)
              : Image.network(
                  'https://image.tmdb.org/t/p/w500' + movie.posterPath!,
                  fit: BoxFit.fitWidth,
                ),
        ),
      ],
    );
  }
}
