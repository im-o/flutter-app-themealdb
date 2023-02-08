part of 'meals_bloc.dart';

enum MealsBlocStatus { initial, loading, success, failure }

class MealsState extends Equatable {
  const MealsState({
    this.data = const <dynamic>[],
    this.hasReachedMax = false,
    this.query = '',
    this.blocStatus = MealsBlocStatus.initial,
    this.failure,
  });

  final List<dynamic> data;
  final bool hasReachedMax;
  final String query;
  final MealsBlocStatus blocStatus;
  final Failure? failure;

  MealsState copyWith({
    List<dynamic>? data,
    String? query,
    bool? hasReachedMax,
    Failure? failure,
    MealsBlocStatus? blocStatus,
  }) {
    return MealsState(
      data: data ?? this.data,
      query: query ?? this.query,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      blocStatus: blocStatus ?? this.blocStatus,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [data, query, hasReachedMax, blocStatus, failure];
}
