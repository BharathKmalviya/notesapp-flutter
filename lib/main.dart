import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/db/models/note.dart';
import 'package:notes/db/note_db.dart';
import 'package:notes/widgets/recent_notes_item.dart';
import 'package:notes_app_cli/notes/index.dart';

void main() => runApp(NoteApp(
      key: UniqueKey(),
    ));

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

class NotesLandingPage extends StatefulWidget {
  const NotesLandingPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NotesLandingPageState();
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

class _NotesLandingPageState extends State<NotesLandingPage> {
  final headerTextStyle =
      const TextStyle(fontWeight: FontWeight.w500, fontSize: 16);

  List<Note> recentNotes = [];

  @override
  void initState() {
    super.initState();
    updateRecentNotes();
  }

  void updateRecentNotes() {
    final db = NoteDB.instance;
    db.registerOnInit((bool onInit) async {
      if (onInit) {
        final List<NoteModel> noteDbModels = await db.getAllNotes();

        final List<Note> notes = noteDbModels
            .map((eachNoteModel) =>
                NoteLandingController.fromNoteModelToNote(eachNoteModel))
            .toList();
        recentNotes = notes;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const SizedBox(
              height: 8,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: recentNotes
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: RecentNotesItem(
                              title: e.title, description: e.description),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text('Daily Tasks', style: headerTextStyle),
          ],
        ),
      ),
    );
  }
}
