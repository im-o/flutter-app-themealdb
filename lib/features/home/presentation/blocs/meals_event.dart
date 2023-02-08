part of 'meals_bloc.dart';

abstract class MealsEvent extends Equatable {
  const MealsEvent();

  @override
  List<Object?> get props => [];
}

class MealsFetched extends MealsEvent {
  const MealsFetched({required this.query});

  final String query;

  MealsFetched copyWith({
    String? query,
  }) {
    return MealsFetched(
      query: query ?? this.query,
    );
  }

  @override
  List<Object?> get props => [query];
}
