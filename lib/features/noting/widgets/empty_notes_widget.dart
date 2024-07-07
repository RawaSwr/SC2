import 'package:flutter/material.dart';
import 'package:simple_note_taking_app/widgets/text_widget.dart';

class EmptyNotesWidget extends StatelessWidget {
  const EmptyNotesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TextWidget(
        'Empty Notes !',
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
