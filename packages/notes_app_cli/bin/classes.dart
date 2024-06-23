

void aa(){
  OptionalNote(title: '');

  var note=Note('note title',null);

  Note.fromAnotherNote(note);
}

class OptionalNote {
  final String title;
  final String? description;

  OptionalNote({required this.title, this.description});
}

class Note {
  final String title;
  final String? description;

  Note(this.title, this.description);

  factory Note.fromAnotherNote(Note note)=> Note(note.title, 'From another note');

  // static
  factory Note.fromNotesLibrary(Note note)=> note;
}


class CollegeNote extends Note {
  String subject;

  CollegeNote(this.subject, super.title, super.description);
}

void aaa(){
  Note.fromAnotherNote(Note('da', 'da'));

  CollegeNote('Pbysics','note title', 'note descruption');
}

abstract class NoteLibrary {
  void getName();
}

mixin PlayableNote {
  void play() {
    print('Playing Note');
  }
}
