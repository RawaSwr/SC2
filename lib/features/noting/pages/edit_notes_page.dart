import 'package:flutter/material.dart';
import 'package:simple_note_taking_app/core/theme/theme.dart';
import 'package:simple_note_taking_app/core/toast.dart';
import 'package:simple_note_taking_app/features/noting/bloc/note_bloc.dart';
import 'package:simple_note_taking_app/features/noting/widgets/note_appbar_widget.dart';
import 'package:simple_note_taking_app/models/note_model.dart';
import 'package:simple_note_taking_app/widgets/text_form_field.dart';
import 'package:simple_note_taking_app/widgets/text_widget.dart';

class EditNotesPage extends StatelessWidget {
  static const String routeName = '/notes/edit';
  EditNotesPage({super.key, this.note});
  final Map? note;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Map noteForm = notesBloc.noteForm;

    if (note?['title'] != null) {
      noteForm['title'] = note!['title'];
    }

    if (note?['description'] != null) {
      noteForm['description'] = note!['description'];
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const NoteAppbarWidget(
        title: 'Edit',
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextFormField(
                label: 'Title',
                hint: 'Inter title',
                padding: const EdgeInsets.symmetric(horizontal: 20),
                initialValue: noteForm['title'],
                onChanged: (value) => noteForm['title'] = value,
              ),
              const SizedBox(
                height: 10,
              ),
              AppTextFormField(
                label: 'Description',
                hint: 'Inter description',
                padding: const EdgeInsets.symmetric(horizontal: 20),
                maxLines: 4,
                initialValue: noteForm['description'],
                onChanged: (value) => noteForm['description'] = value,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      notesBloc.add(EditNoteEvent(
                        NoteModel(
                          id: note?['id'],
                          title: noteForm['title'] ?? note?['title'],
                          description:
                              noteForm['description'] ?? note?['description'],
                          updatedAt: DateTime.now().toIso8601String(),
                        ).toJson(),
                      ));

                      Navigator.pop(context);
                      showToastFlutter('Note edited successfuly !',
                          color: kcRed);
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: kcBlack,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width - 40, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const TextWidget(
                    'Edit',
                    fontSize: 16,
                    color: kcWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
