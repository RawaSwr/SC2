part of 'note_bloc.dart';

sealed class NotesState extends Equatable {
  const NotesState();

  @override
  List<Object> get props => [];
}

final class NotesInitial extends NotesState {}

// get note states
final class GetNotesLoadingState extends NotesState {}

final class GetNotesSuccessState extends NotesState {}

final class GetNotesErrorState extends NotesState {}

// add note states
final class AddNoteLoadingState extends NotesState {}

final class AddNoteSuccessState extends NotesState {}

final class AddNoteErrorState extends NotesState {}

// edit note states
final class EditNoteLoadingState extends NotesState {}

final class EditNoteSuccessState extends NotesState {}

final class EditNoteErrorState extends NotesState {}

// delete note states
final class DeleteNoteLoadingState extends NotesState {}

final class DeleteNoteSuccessState extends NotesState {}

final class DeleteNoteErrorState extends NotesState {}
