part of 'note_bloc.dart';

sealed class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

class GetNotesEvent extends NotesEvent {
  const GetNotesEvent();
}

class AddNoteEvent extends NotesEvent {
  final Map note;
  const AddNoteEvent(this.note);

  @override
  List<Object> get props => [note];
}

class EditNoteEvent extends NotesEvent {
  final Map note;
  const EditNoteEvent(this.note);

  @override
  List<Object> get props => [note];
}

class DeleteNoteEvent extends NotesEvent {
  final Map note;
  const DeleteNoteEvent(this.note);

  @override
  List<Object> get props => [note];
}
