import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_jet_properties/ui/screens/main/search_screen/search_screen_controller.dart';
import '../../theme/app_colors.dart';

Widget priceSlider({
  required BuildContext context,
  required IndicatorRangeSliderThumbShape rangeThumbShape,
  required double priceStartValue,
  required double priceEndValue,
  required Function(RangeValues) onChanged,
}) {
  return SliderTheme(

    data: Theme.of(context).sliderTheme.copyWith(
        inactiveTrackColor: const Color(0xffC8D9E1),
        rangeThumbShape: rangeThumbShape,
        showValueIndicator: ShowValueIndicator.always),
    child: RangeSlider(
      values: RangeValues(priceStartValue, priceEndValue),
      onChanged: (values) {
        onChanged(values);
        // ctrl.onIndicatorRangeChange(values.start, values.end);
        // ctrl.onPriceRangeChange(values.start, values.end);
      },
      min: 18,
      max: 300,
      activeColor: app_Orange_FF7448,
    ),
  );
}


Widget appSimpleSlider({
  required BuildContext context,
  required IndicatorRangeSliderThumbShape rangeThumbShape,
  required double priceStartValue,
  required Function(double) onChanged,
}) {
  return SliderTheme(
    data: Theme.of(context).sliderTheme.copyWith(
        activeTrackColor: app_Orange_FF7448,
        inactiveTrackColor: app_grey_C8D9E1,
        thumbColor: app_Orange_FF7448,

    overlayShape: const RoundSliderOverlayShape(overlayRadius: 1),
    thumbShape: const CircleThumbShape()
    ),
    child: Slider(
      value: priceStartValue,
      max: 100,
      onChanged: (double value) {
        onChanged(value);
      },
    ),
  );

  //   RangeSlider(
  //     values: RangeValues(priceStartValue, priceEndValue),
  //
  //     onChanged: (values) {
  //       onChanged(values);
  //       // ctrl.onIndicatorRangeChange(values.start, values.end);
  //       // ctrl.onPriceRangeChange(values.start, values.end);
  //     },
  //     min: 18,
  //     max: 300,
  //     activeColor: app_Orange_FF7448,
  //   ),
  // );
}


class IndicatorRangeSliderThumbShape<T> extends RangeSliderThumbShape {
  IndicatorRangeSliderThumbShape(this.start, this.end);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(15, 40);
  }

  T start;
  T end;
  late TextPainter labelTextPainter = TextPainter()
    ..textDirection = TextDirection.ltr;

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        bool? isDiscrete,
        bool? isEnabled,
        bool? isOnTop,
        TextDirection? textDirection,
        required SliderThemeData sliderTheme,
        Thumb? thumb,
        bool? isPressed,
      }) {
    final Canvas canvas = context.canvas;
    final Paint strokePaint = Paint()
      ..color = app_Orange_FF7448
      ..strokeWidth = 2.7
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, 15, Paint()..color = Colors.white);
    canvas.drawCircle(center, 15, strokePaint);
    if (thumb == null) {
      return;
    }
    final value = thumb == Thumb.start ? "\$${start}k" : "\$${end}k";
    labelTextPainter.text = TextSpan(
      text: value.toString(),
      style: GoogleFonts.manrope(
        color: app_text_black_1B1B1B,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        height: 2,
      ),
    );
    labelTextPainter.layout();
    labelTextPainter.paint(
        canvas,
        center.translate(
            -labelTextPainter.width / 2, labelTextPainter.height / 2));
  }
}



class CircleThumbShape extends SliderComponentShape {

  final double thumbRadius;

  const CircleThumbShape({
    this.thumbRadius = 6.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(15, 40);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;
    final Paint strokePaint = Paint()
      ..color = app_Orange_FF7448
      ..strokeWidth = 2.7
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, 15, Paint()..color = Colors.white);
    canvas.drawCircle(center, 15, strokePaint);




  }

}










