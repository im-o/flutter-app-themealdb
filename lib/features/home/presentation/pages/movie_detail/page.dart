import 'package:flutter/material.dart';

import '../../../home.dart';
import 'sections/sections.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key, required this.movie}) : super(key: key);

  final MovieResult movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title.toString())),
      body: MovieDetailSection(movie: movie),
    );
  }
}
