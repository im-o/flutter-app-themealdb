import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/recipe.dart';
import '../repositories/recipe_repository.dart';

abstract class RecipeState {}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final List<Recipe> recipes;
  final String selectedCategory;
  final String searchQuery;

  RecipeLoaded({
    required this.recipes,
    this.selectedCategory = 'Semua',
    this.searchQuery = '',
  });
}

class RecipeError extends RecipeState {
  final String message;
  RecipeError(this.message);
}

class RecipeCubit extends Cubit<RecipeState> {
  final RecipeRepository repository;
  List<Recipe> _allRecipes = [];

  RecipeCubit(this.repository) : super(RecipeInitial());

  void fetchRecipes() async {
    try {
      emit(RecipeLoading());
      _allRecipes = await repository.getRecipes();
      emit(RecipeLoaded(recipes: _allRecipes));
    } catch (e) {
      emit(RecipeError(e.toString()));
    }
  }

  void selectCategory(String category) {
    if (state is RecipeLoaded) {
      final currentState = state as RecipeLoaded;
      _applyFilters(category, currentState.searchQuery);
    }
  }

  void searchRecipes(String query) {
    if (state is RecipeLoaded) {
      final currentState = state as RecipeLoaded;
      _applyFilters(currentState.selectedCategory, query);
    }
  }

  void _applyFilters(String category, String query) {
    var filtered = _allRecipes;

    if (category != 'Semua') {
      filtered = filtered.where((r) => r.category == category).toList();
    }

    if (query.isNotEmpty) {
      filtered = filtered
          .where((r) => r.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    emit(RecipeLoaded(
      recipes: filtered,
      selectedCategory: category,
      searchQuery: query,
    ));
  }
}
