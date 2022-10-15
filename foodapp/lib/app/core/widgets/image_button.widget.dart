import 'package:flutter/material.dart';

class ImageButtonWidget extends StatelessWidget {
  final String text;
  final String image;
  const ImageButtonWidget({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFBDC3D2)),
        // color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/$image.png"),
            const SizedBox(
              width: 10,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
