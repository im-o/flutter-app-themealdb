class Recipe {
  final String id;
  final String title;
  final String category;
  final String duration;
  final String difficulty;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;

  Recipe({
    required this.id,
    required this.title,
    required this.category,
    required this.duration,
    required this.difficulty,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      category: json['category'] ?? 'Indonesian',
      duration: json['duration'] ?? '30 mins',
      difficulty: json['difficulty'] ?? 'Medium',
      imageUrl: json['imageUrl'] ?? '',
      ingredients: List<String>.from(json['ingredients'] ?? []),
      steps: List<String>.from(json['steps'] ?? []),
    );
  }
}
