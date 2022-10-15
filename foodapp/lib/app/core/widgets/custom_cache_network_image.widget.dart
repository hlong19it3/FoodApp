import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class CustomCacheNetworkImage extends StatelessWidget {
  final String imagePath;
  const CustomCacheNetworkImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      imageBuilder: (context, imageProvider) => Image(
        image: imageProvider,
        fit: BoxFit.cover,
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.grey.withOpacity(0.3),
        child: Container(
          height: 20,
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
      // progressIndicatorBuilder: (context, url, downloadProgress) => Center(
      //   child: SizedBox(
      //     height: 40,
      //     width: 40,
      //     child: CircularProgressIndicator(
      //       value: downloadProgress.progress,
      //     ),
      //   ),
      // ),
      errorWidget: (context, url, error) => Padding(
        padding: const EdgeInsets.all(7),
        child: SvgPicture.asset(
          "assets/icons/image.svg",
        ),
      ),
    );
  }
}
