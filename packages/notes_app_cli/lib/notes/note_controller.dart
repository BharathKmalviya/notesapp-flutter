// CRUD in note controller
// operations of note

// SOLID

import 'index.dart';

class NoteController
    with NoteOperation, NoteGroupOperation, NoteFavoriteOperation {
  NoteController({List<Note>? notes, List<NoteGroup>? groups})
      : notes = notes ?? List<Note>.empty(growable: true),
        groups = groups ?? List<NoteGroup>.empty(growable: true);

  List<Note> notes;
  List<NoteGroup> groups;

  void addNote(Note note) {
    _addNote(notes, note);
  }

  @override
  String toString() {
    return 'notes:  ${notes.length}';
  }
}

mixin NoteOperation {
  void _addNote(List<Note> notes, Note note) {
    notes.add(note);
  }

  void deleteNote() {}

  void updateNote() {}
}

mixin NoteGroupOperation {
  void addToGroup() {}

  void removeFromGroup() {}

  void deleteGroup() {}

  void transferToAnotherGroup() {}
}

mixin NoteFavoriteOperation {
  void addToFavorites() {}

  void removeFromFavorites() {}
}
