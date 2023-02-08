import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../home.dart';
import 'sections/sections.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('WLB Meals'),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final _mealsBloc = GetIt.I<MealsBloc>();
    return BlocProvider(
      create: (context) => _mealsBloc,
      child: const MealsSection(),
    );
  }
}
