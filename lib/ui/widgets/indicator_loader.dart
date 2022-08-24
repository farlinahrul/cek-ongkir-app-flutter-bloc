import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:startercode_project/utils/colors.dart';


Widget indicatorLoader({double size = 45}) {
  return SpinKitFadingCircle(
    size: size,
    itemBuilder: (BuildContext context, int index) {
      return const DecoratedBox(
        decoration: BoxDecoration(
          color: primary,
          shape: BoxShape.circle,
        ),
      );
    },
  );
}
