class Workout {
  final String title;
  final String imageUrl;
  final String duration;
  final String level;
  final String? calories;
  final String? description;
  final double? progress;

  const Workout({
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.level,
    this.calories,
    this.description,
    this.progress,
  });
}
