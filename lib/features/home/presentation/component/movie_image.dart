import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../home.dart';

class MovieImage extends StatelessWidget {
  final MovieResult movie;

  const MovieImage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: movie.posterPath == null
              ? const Icon(Icons.movie_outlined)
              : Image.network(
                  pathImageTMDB + (movie.posterPath ?? ""),
                  fit: BoxFit.fitWidth,
                ),
        ),
      ],
    );
  }
}
