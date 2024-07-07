import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_note_taking_app/core/gen/assets.gen.dart';
import 'package:simple_note_taking_app/widgets/text_widget.dart';
import '../../../../../core/theme/theme.dart';

// custom appbar for home page
class NoteAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const NoteAppbarWidget({Key? key, this.title, this.icon})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  final String? title;
  final String? icon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kcWhite,
      surfaceTintColor: kcWhite,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon == null
              ? const SizedBox.shrink()
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: SvgPicture.asset(
                   icon ?? Assets.icons.note,
                    height: 25,
                  ),
              ),
         
          TextWidget(
            title ?? 'Notes',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
      // ),
      elevation: 0,
      shadowColor: kcGrey.withOpacity(0.3),
      scrolledUnderElevation: 0,
    );
  }
}
