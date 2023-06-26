import 'package:flutter/material.dart';
import 'package:house_jet_properties/theme/app_assets.dart';

import '../../theme/app_colors.dart';

loadingBuilder(BuildContext context, child, loadingProgress){

    if (loadingProgress == null) return child;

    return Center(
      child: CircularProgressIndicator(
        color: app_Orange_FF7448,
        value: loadingProgress.expectedTotalBytes !=
            null
            ? loadingProgress.cumulativeBytesLoaded /
            loadingProgress.expectedTotalBytes!
            : null,
      ),
    );


}

 networkImageErrorBuilder(context, error, stackTrace){

    return () {
      return Image.asset(housePlaceHolder);
    };


}