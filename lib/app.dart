import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:simple_note_taking_app/core/routes.dart';
import 'package:simple_note_taking_app/core/theme/theme.dart';
import 'package:simple_note_taking_app/features/noting/pages/splash_page.dart';
import 'package:simple_note_taking_app/widgets/loading_widget.dart';

final GlobalKey globalKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayColor: kcWhite.withOpacity(0.5),
      overlayWidget: const LoadingWidget(),
      child: MaterialApp(
        key: globalKey,
        debugShowCheckedModeBanner: false,
        title: 'Simple Note Taking App',
        theme: AppTheme.lightTheme,
        routes: routes,
        initialRoute: SplashPage.routeName,
        builder: (context, child) => child!,
      ),
    );
  }
}
