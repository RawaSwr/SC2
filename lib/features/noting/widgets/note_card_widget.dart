import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_note_taking_app/core/gen/assets.gen.dart';
import 'package:simple_note_taking_app/core/theme/theme.dart';
import 'package:simple_note_taking_app/core/toast.dart';
import 'package:simple_note_taking_app/features/noting/bloc/note_bloc.dart';
import 'package:simple_note_taking_app/widgets/text_widget.dart';
import 'package:simple_note_taking_app/pages.dart';

class NoteCardWidget extends StatelessWidget {
  const NoteCardWidget({super.key, required this.note});
  final Map note;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ViewNotesPage(
                  note: note,
                )));
      },
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.top,
        leading: CircleAvatar(
          backgroundColor: kcBlack,
          child: TextWidget(
            note['id'].toString(),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: kcWhite,
          ),
        ),
        title: TextWidget(
          note['title'],
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        subtitle: TextWidget(
          note['description'],
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditNotesPage(
                          note: note,
                        )));
              },
              child: SvgPicture.asset(Assets.icons.edit),
            ),
            InkWell(
              onTap: () {
                // show dialog to delete note
                notesBloc.add(DeleteNoteEvent(note));
                showToastFlutter('Note deleted successfuly !', color: kcRed);
              },
              child: SvgPicture.asset(
                Assets.icons.delete,
                color: kcRed,
              ),
            )
          ],
        ),
      ),
    );
  }
}
