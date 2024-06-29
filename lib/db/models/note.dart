import 'package:isar/isar.dart';
part 'note.g.dart';

@collection
class NoteModel {
  Id id = Isar.autoIncrement;
  final String title;
  final String? description;
  final DateTime createdAt;
  final bool isFavorite;

  NoteModel({
    required this.title,
    required this.createdAt,
    this.description,
    this.isFavorite = false,

  });
}
