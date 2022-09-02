import 'package:flutter/material.dart';

import 'sections/sections.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dicoding Submission'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return const MoviesSection();
  }
}
