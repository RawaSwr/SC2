import 'package:flutter/material.dart';
import 'package:simple_note_taking_app/features/noting/widgets/note_appbar_widget.dart';
import 'package:simple_note_taking_app/widgets/text_form_field.dart';

class ViewNotesPage extends StatelessWidget {
  static const String routeName = '/notes/view';
  const ViewNotesPage({super.key, this.note});
  final Map? note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: NoteAppbarWidget(
        title: 'View ${note?['title'] ?? ''}',
      ),
      body: SafeArea(
        child: Column(
          children: [
            AppTextFormField(
              label: 'Title',
              hint: 'Inter title',
              padding: const EdgeInsets.symmetric(horizontal: 20),
              initialValue: note?['title'],
              enabled: false,
            ),
            const SizedBox(
              height: 10,
            ),
            AppTextFormField(
              label: 'Description',
              hint: 'Inter description',
              padding: const EdgeInsets.symmetric(horizontal: 20),
              maxLines: 5,
              initialValue: note?['description'],
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
