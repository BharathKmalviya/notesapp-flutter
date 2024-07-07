// group of notes

import 'package:isar/isar.dart';

import 'note.dart';

@collection
class NoteGroupModel {
  final int id;
  final List<NoteModel> notes;
  final String name;
  final DateTime createdAt;

  NoteGroupModel({
    required this.id,
    required this.name,
    this.notes = const [],
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}
