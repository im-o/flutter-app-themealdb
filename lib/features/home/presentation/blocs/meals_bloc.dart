import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../../home.dart';

part 'meals_event.dart';

part 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  MealsBloc({required this.useCase}) : super(const MealsState()) {
    on<MealsFetched>(_onDataFetched);
  }

  final GetMealsUseCase useCase;

  FutureOr<void> _onDataFetched(
    MealsFetched event,
    Emitter<MealsState> emit,
  ) async {
    try {
      emit(state.copyWith(blocStatus: MealsBlocStatus.loading));
      final result = await useCase(event.query);
      result.fold((failure) {
        emit(
          state.copyWith(
            blocStatus: MealsBlocStatus.failure,
            failure: failure,
          ),
        );
      }, (data) {
        emit(
          state.copyWith(
            blocStatus: MealsBlocStatus.success,
            hasReachedMax: data == data,
            data: data.data,
          ),
        );
      });

      // dynamic meals = await useCase.call("");
      // if (meals != null) {
      //   return emit(state.copyWith(
      //     status: MealsStatus.success,
      //     meals: meals,
      //     hasReachedMax: false,
      //   ));
      // }
    } catch (e) {
      emit(
        state.copyWith(
          blocStatus: MealsBlocStatus.failure,
          failure: e.toFailure(),
        ),
      );
      return emit(state.copyWith(blocStatus: MealsBlocStatus.failure));
    }
  }
}
