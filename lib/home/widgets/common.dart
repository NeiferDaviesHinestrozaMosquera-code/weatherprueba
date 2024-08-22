import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';


showDownloading() {
  const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        Text("Cargando...."),
      ],
    ),
  );
}

getAnimatedSnackbarError(String text, BuildContext context) {
  AnimatedSnackBar.material(
    text,
    type: AnimatedSnackBarType.error,
    desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
  ).show(context);
}