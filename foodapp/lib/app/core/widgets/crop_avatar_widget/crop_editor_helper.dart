// import 'dart:typed_data';
// import 'dart:ui';

// import 'package:extended_image/extended_image.dart';
// import 'package:flutter/foundation.dart';

// import 'package:http_client_helper/http_client_helper.dart';
// import 'package:image/image.dart';

// Future<Uint8List?> cropImageData({
//   required ExtendedImageEditorState state,
// }) async {
//   /// Crop rect base on raw image
//   final Rect? cropRect = state.getCropRect();

//   final Uint8List data = kIsWeb &&
//           state.widget.extendedImageState.imageWidget.image
//               is ExtendedNetworkImageProvider
//       ? await _loadNetwork(state.widget.extendedImageState.imageWidget.image
//           as ExtendedNetworkImageProvider)
//       : state.rawImageData;

//   final EditActionDetails editAction = state.editAction!;

//   Animation? src = await compute(decodeAnimation, data);

//   if (src != null) {
//     /// handle every frame.
//     src.frames = src.frames.map((Image image) {
//       /// clear orientation
//       image = bakeOrientation(image);

//       if (editAction.needCrop) {
//         image = copyCrop(
//           image,
//           cropRect!.left.toInt(),
//           cropRect.top.toInt(),
//           cropRect.width.toInt(),
//           cropRect.height.toInt(),
//         );
//       }

//       if (editAction.needFlip) {
//         late Flip mode;
//         if (editAction.flipY && editAction.flipX) {
//           mode = Flip.both;
//         } else if (editAction.flipY) {
//           mode = Flip.horizontal;
//         } else if (editAction.flipX) {
//           mode = Flip.vertical;
//         }
//         image = flip(image, mode);
//       }

//       if (editAction.hasRotateAngle) {
//         image = copyRotate(image, editAction.rotateAngle);
//       }
//       return image;
//     }).toList();
//   }

//   /// can encode this image
//   /// it will not block ui with using isolate.
//   List<int>? fileData;
//   if (src != null) {
//     final bool onlyOneFrame = src.numFrames == 1;
//     if (kIsWeb) {
//       fileData = onlyOneFrame ? encodeJpg(src.first) : encodeGifAnimation(src);
//     } else {
//       fileData = onlyOneFrame
//           ? await compute(encodeJpg, src.first)
//           : await compute(encodeGifAnimation, src);
//     }
//   }
//   return Uint8List.fromList(fileData!);
// }

// Future<Uint8List> _loadNetwork(ExtendedNetworkImageProvider key) async {
//   try {
//     final Response? response = await HttpClientHelper.get(
//       Uri.parse(key.url),
//       headers: key.headers,
//       timeLimit: key.timeLimit,
//       timeRetry: key.timeRetry,
//       retries: key.retries,
//       cancelToken: key.cancelToken,
//     );
//     return response!.bodyBytes;
//   } on OperationCanceledError catch (_) {
//     return Future<Uint8List>.error(
//       /// Don't need to translate at here
//       StateError('User cancel request ${key.url}.'),
//     );
//   } catch (e) {
//     return Future<Uint8List>.error(
//       StateError('failed load ${key.url}. \n $e'),
//     );
//   }
// }
