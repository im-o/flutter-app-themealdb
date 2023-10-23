import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/core.dart';
import '../../../home.dart';
import 'sections/sections.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorDark,
          title: CustomSearchBar(
            query: '',
            hint: 'Search Meals...',
            isEnabled: false,
            height: 40,
            onSearchClicked: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SearchBarSection(),
              ));
            },
            onQueryChange: (value) {},
          ),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    final _mealsBloc = GetIt.I<MealsBloc>();
    return BlocProvider(
      create: (context) => _mealsBloc,
      child: const MealsSection(query: ''),
    );
  }
}
