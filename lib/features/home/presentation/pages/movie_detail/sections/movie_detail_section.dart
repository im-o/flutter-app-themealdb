import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../../../home.dart';

class MovieDetailSection extends StatelessWidget {
  const MovieDetailSection({Key? key, required this.movie}) : super(key: key);

  final MovieResult movie;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.dp16),
          child: Column(
            children: [
              SizedBox(
                width: constraints.maxWidth > 900 ? Dimens.dp500 : Dimens.dp200,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: constraints.maxWidth > 900
                        ? BorderRadius.circular(Dimens.dp16)
                        : BorderRadius.circular(Dimens.dp8),
                  ),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: MovieImage(movie: movie),
                ),
              ),
              const SizedBox(height: Dimens.dp16),
              TitleText(
                movie.title ?? "",
                align: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: Dimens.dp8),
              SubTitleText(
                "${movie.releaseDate} • ${movie.originalLanguage} • "
                "${movie.voteCount} • ${movie.adult}",
                style: const TextStyle(
                  fontSize: Dimens.dp14,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: Dimens.dp16),
              const Divider(thickness: Dimens.dp3),
              const SizedBox(height: Dimens.dp16),
              const SubTitleText('Overview'),
              const SizedBox(height: Dimens.dp16),
              RegularText(
                movie.overview ?? "",
                align: TextAlign.justify,
                style: const TextStyle(
                  color: Colors.white60,
                ),
              ),
              const SizedBox(height: Dimens.dp16),
            ],
          ),
        ),
      );
    });
  }
}
