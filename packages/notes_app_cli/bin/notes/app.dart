import 'index.dart';

void main() {
  // create notes to db
  // store notes in list
  final NoteController controller = NoteController();
  controller.addNote(Note(id: 1, title: 'Hello Vivek'));

  print(controller);
}
