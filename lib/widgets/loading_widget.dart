import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../core/theme/theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 45,
        height: 45,
        child: SpinKitFadingFour(
        color: kcBlack,
        size: 30,
      ),
      ),
    );
  }
}
