import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../../core/core.dart';
import '../../../../home.dart';
import '../../meal_detail/page.dart';

class MealsSection extends StatefulWidget {
  const MealsSection({Key? key}) : super(key: key);

  @override
  State<MealsSection> createState() => _MealsSectionState();
}

class _MealsSectionState extends State<MealsSection> {
  late MealsBloc _mealsBloc;

  var _event = const MealsFetched(query: '');

  @override
  void initState() {
    _mealsBloc = BlocProvider.of<MealsBloc>(context);
    _initFetchData();
    super.initState();
  }

  void _initFetchData() {
    _fetchData(_event);
  }

  void _fetchData(MealsFetched event) {
    _mealsBloc.add(event);
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
            if (state.data.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: Dimens.dp0,
                  top: Dimens.dp0,
                  left: Dimens.dp8,
                  right: Dimens.dp8,
                ),
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
}
