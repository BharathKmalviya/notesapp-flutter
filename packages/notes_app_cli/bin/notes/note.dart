class Note {
  final int id;
  final String title;
  final String? description;
  final DateTime createdAt;
  final bool isFavorite;

  Note({
    required this.id,
    required this.title,
    this.description,
    this.isFavorite = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}
