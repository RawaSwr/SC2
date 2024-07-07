// ignore: depend_on_referenced_packages
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_note_taking_app/core/local_storage.dart';
import 'package:simple_note_taking_app/core/toast.dart';
import 'package:simple_note_taking_app/models/note_model.dart';

import '../../../../core/theme/theme.dart';
import '../../../../injectable_config.dart';

part 'note_event.dart';
part 'note_state.dart';

NotesBloc get notesBloc => getIt<NotesBloc>();

@LazySingleton()
class NotesBloc extends Bloc<NotesEvent, NotesState> {
  // notes
  List<Map> _notes = [];
  List<Map> get notes => _notes;

  // note form
  Map _noteForm = {};
  Map get noteForm => _noteForm;

  NotesBloc() : super(NotesInitial()) {
    on<GetNotesEvent>((event, emit) async {
      emit(GetNotesLoadingState());
      try {
        final String notesString = await localStorageGetString('notes');
        final decoded = jsonDecode(notesString);

        if (decoded != null && decoded != '' && decoded.isNotEmpty) {
          _notes = decoded.map<Map>((e) {
            return NoteModel(
                    id: e['id'],
                    title: e['title'],
                    description: e['description'],
                    createdAt: e['createdAt'],
                    updatedAt: e['updatedAt'])
                .toJson();
          }).toList();
          _notes.sort((a, b) => a['id'] - b['id']);
          emit(GetNotesSuccessState());
        }
      } catch (e) {
        log('error===>${e.toString()}');
        emit(GetNotesErrorState());
      }
    });

    on<AddNoteEvent>((event, emit) async {
      emit(AddNoteLoadingState());
      try {
        _notes.add(event.note);
        _notes.sort((a, b) => a['id'] - b['id']);
        final decoded = jsonEncode(_notes);
        await localStorageSetString('notes', decoded);
        emit(AddNoteSuccessState());
      } catch (e) {
        log('error===>${e.toString()}');
        showToastFlutter('unknown_error', color: kcRed);
        emit(AddNoteErrorState());
      }
    });

    on<EditNoteEvent>((event, emit) async {
      emit(EditNoteLoadingState());
      try {
        _notes.removeWhere((element) => element['id'] == event.note['id']);
        _notes.add(event.note);
        _notes.sort((a, b) => a['id'] - b['id']);
        final decoded = jsonEncode(_notes);
        await localStorageSetString('notes', decoded);
        emit(EditNoteSuccessState());
      } catch (e) {
        log('error===>${e.toString()}');
        showToastFlutter('unknown_error', color: kcRed);
        emit(EditNoteErrorState());
      }
    });

    on<DeleteNoteEvent>((event, emit) async {
      emit(DeleteNoteLoadingState());
      try {
        _notes.removeWhere((element) => element['id'] == event.note['id']);
        _notes.sort((a, b) => a['id'] - b['id']);
        final decoded = jsonEncode(_notes);
        await localStorageSetString('notes', decoded);
        emit(DeleteNoteSuccessState());
      } catch (e) {
        log('error===>${e.toString()}');
        showToastFlutter('unknown_error', color: kcRed);
        emit(DeleteNoteErrorState());
      }
    });
  }
}
