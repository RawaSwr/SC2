import 'package:flutter/material.dart';
import 'package:simple_note_taking_app/core/gen/assets.gen.dart';
import 'package:simple_note_taking_app/core/theme/theme.dart';
import 'package:simple_note_taking_app/features/noting/pages/notes_page.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Future<void> didChangeDependencies() async {
     await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacementNamed(
        context, NotesPage.routeName);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcWhite,
      body: Center(
        child: Image.asset(
          Assets.images.logo.path,
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
