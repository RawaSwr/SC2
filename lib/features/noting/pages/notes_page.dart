import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_note_taking_app/core/gen/assets.gen.dart';
import 'package:simple_note_taking_app/core/theme/theme.dart';
import 'package:simple_note_taking_app/features/noting/bloc/note_bloc.dart';
import 'package:simple_note_taking_app/features/noting/pages/add_notes_page.dart';
import 'package:simple_note_taking_app/features/noting/widgets/note_appbar_widget.dart';
import 'package:simple_note_taking_app/features/noting/widgets/note_card_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_note_taking_app/features/noting/widgets/empty_notes_widget.dart';

class NotesPage extends StatefulWidget {
  static const String routeName = '/notes';
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  void initState() {
    notesBloc.add(const GetNotesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: NoteAppbarWidget(
        icon: Assets.icons.note,
        title: 'Notes',
      ),
      body: SafeArea(
        child: BlocBuilder<NotesBloc, NotesState>(
          bloc: notesBloc,
          builder: (context, state) {
            return notesBloc.notes.isEmpty
                ? const EmptyNotesWidget()
                : ListView(
                    children: [
                      ...notesBloc.notes.map((e) => NoteCardWidget(note: e))
                    ],
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kcWhite,
        onPressed: () {
          Navigator.pushNamed(context, AddNotesPage.routeName);
        },
        child: SvgPicture.asset(
          Assets.icons.addFill,
          width: 25,
        ),
      ),
    );
  }
}
