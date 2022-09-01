import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../../core/core.dart';
import '../../../../home.dart';
import '../../movie_detail/page.dart';

class MoviesSection extends StatefulWidget {
  const MoviesSection({Key? key}) : super(key: key);

  @override
  State<MoviesSection> createState() => _MoviesSectionState();
}

class _MoviesSectionState extends State<MoviesSection> {
  List<MovieResult> _movies = [];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return _movies.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(Dimens.dp4),
              child: SingleChildScrollView(
                child: StaggeredGrid.count(
                  crossAxisCount: constraints.maxWidth > 900 ? 5 : 3,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  children: _movies.map((movie) {
                    return MovieItemCard(
                      movie: movie,
                      onTapMovie: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MovieDetailPage(movie: movie),
                        ));
                      },
                    );
                  }).toList(),
                ),
              ),
            )
          : const Center(child: Text("Data is empty!"));
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/themoviedb.json');
    var data = await json.decode(response);
    var movies = MovieData.fromJson(data).results;
    setState(() => _movies = movies ?? []);
  }
}
