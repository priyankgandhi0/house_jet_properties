import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:house_jet_properties/theme/app_assets.dart';

import '../theme/app_colors.dart';


class MapUtils {
  LatLngBounds computeBounds(List<LatLng> list) {
    assert(list.isNotEmpty);
    var firstLatLng = list.first;
    var s = firstLatLng.latitude,
        n = firstLatLng.latitude,
        w = firstLatLng.longitude,
        e = firstLatLng.longitude;
    for (var i = 1; i < list.length; i++) {
      var latLng = list[i];
      s = min(s, latLng.latitude);
      n = max(n, latLng.latitude);
      w = min(w, latLng.longitude);
      e = max(e, latLng.longitude);
    }
    return LatLngBounds(southwest: LatLng(s, w), northeast: LatLng(n, e));
  }

  Future<BitmapDescriptor> getClusterImages(int size, {String? text}) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final Paint paint1 = Paint()..color = app_Orange_FF7448;
    final Paint paint2 = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
            fontSize: size / 2.5,
            color: Colors.white,
            fontWeight: FontWeight.normal),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }

  Future<BitmapDescriptor> getMarkerImage(
    Size size, {
    String? id,
  }) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();

    final Canvas canvas = Canvas(pictureRecorder);

    ui.Image image = await getImageFromPath(markerImage);
    Rect bgImageRect = const Offset(0, 1) & Size(size.width, size.height);
    paintImage(
      canvas: canvas,
      image: image,
      rect: bgImageRect,
      fit: BoxFit.fitHeight,
    );

    final ui.Image markerAsImage = await pictureRecorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());

    ByteData? byteData =
        await markerAsImage.toByteData(format: ui.ImageByteFormat.png);

    // return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
    return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }

  /// This code use for convert image to bytes
  Future<ui.Image> getImageFromPath(String imagePath) async {
    final ByteData bytes = await rootBundle.load(imagePath);
    final Uint8List imageBytes = bytes.buffer.asUint8List();

    final Completer<ui.Image> completer = Completer();

    ui.decodeImageFromList(imageBytes, (ui.Image img) {
      return completer.complete(img);
    });

    return completer.future;
  }
}
