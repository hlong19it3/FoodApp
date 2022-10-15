import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'components/box_decoration.dart';

class ShapeShimmer extends StatelessWidget {
  final double width;
  final double height;
  const ShapeShimmer({
    Key? key,
    this.width = double.infinity,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.1),
      highlightColor: Colors.grey.withOpacity(0.3),
      child: Container(
        height: height,
        width: width,
        decoration: boxDecoration(),
      ),
    );
  }
}
