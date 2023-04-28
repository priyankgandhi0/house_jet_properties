import 'package:flutter/material.dart';

import '../../../Theme/app_colors.dart';

class AppLoader extends StatelessWidget {
  final bool visible;

  const AppLoader({Key? key, required this.visible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(

        color: Colors.black.withOpacity(0.3),
        child: Center(

          child: CircularProgressIndicator(
            color: app_Orange_FF7448,
          ),
        ),
      ),
    );
  }
}
