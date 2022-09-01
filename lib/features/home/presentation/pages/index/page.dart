import 'package:flutter/material.dart';

import 'sections/sections.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dicoding Submission')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return const MoviesSection();
  }
}
