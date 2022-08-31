import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../home.dart';

class MovieItemCard extends StatelessWidget {
  final MovieResult movie;
  final Function onTapMovie;

  const MovieItemCard({
    Key? key,
    required this.movie,
    required this.onTapMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: MovieImage(movie: movie),
      ),
      onTap: () {
        onTapMovie();
      },
    );
  }
}
