import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../../core/core.dart';
import '../../../../home.dart';
import '../../meal_detail/page.dart';

class MealsSection extends StatefulWidget {
  final String query;

  const MealsSection({Key? key, required this.query}) : super(key: key);

  @override
  State<MealsSection> createState() => _MealsSectionState();
}

class _MealsSectionState extends State<MealsSection> {
  late MealsBloc _mealsBloc;
  late MealsFetched _event;

  @override
  void initState() {
    super.initState();
    _mealsBloc = BlocProvider.of<MealsBloc>(context);
    _event = MealsFetched(query: widget.query);
    _initFetchData();
  }

  void _initFetchData() {
    _fetchData(_event);
  }

  void _fetchData(MealsFetched event) {
    _mealsBloc.add(event);
  }

  @override
  void didUpdateWidget(covariant MealsSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.query != widget.query) {
      _event = MealsFetched(query: widget.query);
      _fetchData(_event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return BlocConsumer<MealsBloc, MealsState>(
      listener: (context, state) {
        if (state.blocStatus == MealsBlocStatus.success) {
          _event = _event.copyWith(query: state.query);
        }
      },
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (state.data.isNotEmpty &&
                state.blocStatus == MealsBlocStatus.success) {
              return _buildMealsGrid(state, constraints);
            } else if (state.data.isEmpty &&
                state.blocStatus == MealsBlocStatus.success) {
              return const Center(child: Text("Data is empty!"));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }

  Widget _buildMealsGrid(MealsState state, BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp12),
      child: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: constraints.maxWidth > 700 ? 5 : 3,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          children: state.data.map((meal) {
            return MealItemCard(
              meal: meal,
              onTapMeal: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MealDetailPage(meal: meal),
                ));
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
