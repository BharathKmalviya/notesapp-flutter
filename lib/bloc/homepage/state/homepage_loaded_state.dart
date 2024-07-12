import 'package:notes/bloc/homepage/state/homepage_state.dart';
import 'package:notes_app_cli/notes/index.dart';

class HomepageLoadedState extends HomepageState {
  final List<Note> notes;

  HomepageLoadedState(this.notes);
}
