import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:notes/bloc/homepage/event/load_homepage_event.dart';
import 'package:notes/bloc/homepage/homepage_bloc.dart';
import 'package:notes/bloc/homepage/state/homepage_loaded_state.dart';
import 'package:notes/bloc/homepage/state/homepage_loading_state.dart';
import 'package:notes/bloc/homepage/state/homepage_state.dart';
import 'package:notes/db/models/note.dart';
import 'package:notes/db/note_db.dart';
import 'package:notes/widgets/recent_notes_item.dart';
import 'package:notes_app_cli/notes/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.instance.registerSingleton<Database>(NoteDB.instance);

  runApp(NoteApp(
    key: UniqueKey(),
  ));
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotesLandingPage(
        key: UniqueKey(),
      ),
    );
  }
}

class NoteLandingController {
  static Note fromNoteModelToNote(NoteModel noteModel) {
    return Note(
        id: noteModel.id,
        title: noteModel.title,
        description: noteModel.description);
  }
}

class NotesLandingPage extends StatelessWidget {
  const NotesLandingPage({super.key});

  final headerTextStyle =
      const TextStyle(fontWeight: FontWeight.w500, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomepageBloc>(
        create: (_) => HomepageBloc()..add(LoadHomepageEvent()),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            actions: const [Icon(Icons.search)],
          ),
          drawer: Container(
            width: 300,
            color: Colors.white,
            child: const SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Homepage'),
                  SizedBox(
                    height: 16,
                  ),
                  Text('Favorites'),
                  Spacer(
                    flex: 2,
                  ),
                  Text('Logout'),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My Notes',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Reminders',
                  style: headerTextStyle,
                ),
                // const SizedBox(
                //   height: 8,
                // ),

                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Positioned(child: Text('hello',style: TextStyle(color: Colors.black, fontSize: 16)),
                      right: 100,
                        top: -20,
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: const Text(
                          'Daily Supplements',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: const Text(
                          'Pick up mail from Mumbai',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: const Text(
                          'Run',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: const Text(
                          'Daily Supplements',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text('Recent Notes', style: headerTextStyle),
                const SizedBox(
                  height: 8,
                ),
                BlocBuilder<HomepageBloc, HomepageState>(
                    builder: (context, HomepageState state) {
                  if (state is HomepageLoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is HomepageLoadedState) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: state.notes
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: RecentNotesItem(
                                      title: e.title,
                                      description: e.description),
                                ))
                            .toList(),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
                const SizedBox(
                  height: 16,
                ),
                Text('Daily Tasks', style: headerTextStyle),
              ],
            ),
          ),
        ));
  }
}
