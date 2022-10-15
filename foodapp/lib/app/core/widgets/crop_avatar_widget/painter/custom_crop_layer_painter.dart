// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:extended_image/extended_image.dart';

// class CustomEditorCropLayerPainter extends EditorCropLayerPainter {
//   @override
//   void paintCorners(
//     Canvas canvas,
//     Size size,
//     ExtendedImageCropLayerPainter painter,
//   ) {
//     final Paint paint = Paint()
//       ..color = painter.cornerColor
//       ..style = PaintingStyle.fill;
//     final Rect cropRect = painter.cropRect;
//     const double radius = 6;
//     canvas.drawCircle(Offset(cropRect.left, cropRect.top), radius, paint);
//     canvas.drawCircle(Offset(cropRect.right, cropRect.top), radius, paint);
//     canvas.drawCircle(Offset(cropRect.left, cropRect.bottom), radius, paint);
//     canvas.drawCircle(Offset(cropRect.right, cropRect.bottom), radius, paint);
//   }
// }
