import 'package:isar/isar.dart';
import 'package:notes/db/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDB implements Database {
  late Isar isar;
  bool initiated = false;
  List<Function(bool onInit)> _listeners = [];

  NoteDB._() {
    // path to initialize
    _initDb();
  }

  static NoteDB instance = NoteDB._();

  @override
  void registerOnInit(Function(bool onInit) init) {
    _listeners.add(init);
    if (initiated) {
      init(initiated);
    }
  }

  void notify() {
    for (Function(bool) each in _listeners) {
      each(initiated);
    }
  }

  Future<void> _initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteModelSchema],
      directory: dir.path,
    );

    initiated = true;
    notify();
  }

  @override
  Future<List<NoteModel>> getAllNotes() {
    return isar.noteModels.where().findAll();
  }

  Future<void> saveNote(NoteModel note) async {
    await isar.writeTxn(() async => await isar.noteModels.put(note));
  }
}

abstract class Database {
  Future<List<NoteModel>> getAllNotes();

  void registerOnInit(Function(bool onInit) init);
}
