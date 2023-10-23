/// Created by github.com/im-o on 10/22/2023.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../core/core.dart';
import '../../../presentation.dart';
import 'sections.dart';

class SearchBarSection extends StatefulWidget {
  const SearchBarSection({Key? key}) : super(key: key);

  @override
  State<SearchBarSection> createState() => _SearchBarSectionState();
}

class _SearchBarSectionState extends State<SearchBarSection> {
  late String query = '';
  final _mealsBloc = GetIt.I<MealsBloc>();

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
            isEnabled: true,
            height: Dimens.dp40,
            onQueryChange: (newQuery) => query = newQuery,
            onSubmitted: (newQuery) => setState(() => query = newQuery ?? ''),
          ),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocProvider(
      create: (context) => _mealsBloc,
      child: query != ''
          ? MealsSection(query: query)
          : const Center(
              child: Text('Try searching for something meal...'),
            ),
    );
  }
}
