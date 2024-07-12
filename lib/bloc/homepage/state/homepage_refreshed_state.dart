import 'package:notes/bloc/homepage/state/homepage_state.dart';
import 'package:notes_app_cli/notes/index.dart';

class HomepageRefreshedState extends HomepageState {
  final List<Note> notes;

  HomepageRefreshedState(this.notes);
}
