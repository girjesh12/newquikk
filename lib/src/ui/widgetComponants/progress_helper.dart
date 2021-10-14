import 'package:flutter/material.dart';
import 'package:newquikk/res/colors.dart';

class Loader {

  /* Function to display circular progress bar */
  static display(BuildContext context) {
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (BuildContext context, _, __) {
          return new ProgressBar(opacity: 0.5);
        }));
  }

  /* Function to stop circular progress bar */
  static close(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class ProgressOverlay extends StatelessWidget {
  final double opacity;

  const ProgressOverlay({this.opacity = 0.6}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: AppColors.mainColor,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
      color: Color.fromRGBO(0, 0, 0, opacity),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final double opacity;

  const ProgressBar({this.opacity = 0.6});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: AppColors.mainColor,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
      color: Color.fromRGBO(255, 255, 255, opacity),
    );
  }
}
