import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../cubits/recipe_cubit.dart';
import '../widgets/recipe_card.dart';
import '../widgets/glass_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 24),
              _buildSearchField(context),
              const SizedBox(height: 24),
              _buildCategories(),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<RecipeCubit, RecipeState>(
                  builder: (context, state) {
                    if (state is RecipeLoading) {
                      return MasonryGridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 250,
                            child: GlassContainer(
                              borderRadius: BorderRadius.circular(24),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xFFFF5722),
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is RecipeLoaded) {
                      return MasonryGridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        itemCount: state.recipes.length,
                        itemBuilder: (context, index) {
                          return RecipeCard(recipe: state.recipes[index]);
                        },
                      );
                    } else if (state is RecipeError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Halo, Foodie! 👋',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            Text(
              'Meals Master',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      borderRadius: BorderRadius.circular(16),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          context.read<RecipeCubit>().searchRecipes(value);
          setState(() {}); // Rebuild to show/hide clear icon
        },
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          icon: const Icon(Icons.search, color: Colors.white70),
          hintText: 'Cari resep Indonesia...',
          hintStyle: const TextStyle(color: Colors.white38),
          border: InputBorder.none,
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.white70),
                  onPressed: () {
                    _searchController.clear();
                    context.read<RecipeCubit>().searchRecipes('');
                    setState(() {});
                  },
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildCategories() {
    final categories = [
      'Semua',
      'Ayam',
      'Daging',
      'Sayuran',
      'Sarapan',
      'Camilan'
    ];
    return SizedBox(
      height: 40,
      child: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          final selectedCategory =
              state is RecipeLoaded ? state.selectedCategory : 'Semua';

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = category == selectedCategory;

              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ChoiceChip(
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      context.read<RecipeCubit>().selectCategory(category);
                    }
                  },
                  selectedColor: const Color(0xFFFF5722),
                  backgroundColor: Colors.white10,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.white70,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  showCheckmark: false,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
