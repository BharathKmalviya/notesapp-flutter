// State, Event
// BLoC

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:notes/bloc/homepage/event/delete_homepage_item_event.dart';
import 'package:notes/bloc/homepage/event/homepage_event.dart';
import 'package:notes/bloc/homepage/event/load_homepage_event.dart';
import 'package:notes/bloc/homepage/state/homepage_error_state.dart';
import 'package:notes/bloc/homepage/state/homepage_init_state.dart';
import 'package:notes/bloc/homepage/state/homepage_loaded_state.dart';
import 'package:notes/bloc/homepage/state/homepage_loading_state.dart';
import 'package:notes/bloc/homepage/state/homepage_state.dart';
import 'package:notes/db/models/note.dart';
import 'package:notes/db/note_db.dart';
import 'package:notes/main.dart';
import 'package:notes_app_cli/notes/index.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageInitState()) {
    on<LoadHomepageEvent>(onLoadEvent);
    on<DeleteHomepageItemEvent>(onDeleteEvent);
  }

  Future<void> onLoadEvent(
      LoadHomepageEvent event, Emitter<HomepageState> emitter) async {
    // sending loading state
    emitter(HomepageLoadingState());
    final completer = Completer();
    // actual operation

    try {
      if (GetIt.instance.isRegistered<Database>()) {
        final db = GetIt.instance.get<Database>();


        db.registerOnInit((bool onInit) async {
          if (onInit) {
            // await Future.delayed(const Duration(seconds: 5));
            final List<NoteModel> noteDbModels = await db.getAllNotes();

            final List<Note> notes = noteDbModels
                .map((eachNoteModel) =>
                    NoteLandingController.fromNoteModelToNote(eachNoteModel))
                .toList();

            emitter(HomepageLoadedState(notes));
            completer.complete();// function completed
          }
        });
      }
    } catch (_) {
      emitter(HomepageErrorState());
      completer.complete();
    }

    // completed
    return completer.future;
  }

  void onDeleteEvent(
      DeleteHomepageItemEvent event, Emitter<HomepageState> emitter) {}
}
