// group of notes

import 'note.dart';

class NoteGroup {
  final int id;
  final List<Note> notes;
  final String name;
  final DateTime createdAt;

  NoteGroup({
    required this.id,
    required this.name,
    this.notes = const [],
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}
