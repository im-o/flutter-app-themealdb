import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'repositories/recipe_repository.dart';
import 'cubits/recipe_cubit.dart';
import 'views/home_screen.dart';

void main() {
  runApp(const MealsMasterApp());
}

class MealsMasterApp extends StatelessWidget {
  const MealsMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeRepository = RecipeRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecipeCubit(recipeRepository)..fetchRecipes(),
        ),
      ],
      child: MaterialApp(
        title: 'Meals Master',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFFF5722),
            brightness: Brightness.dark,
          ),
          textTheme: GoogleFonts.outfitTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
