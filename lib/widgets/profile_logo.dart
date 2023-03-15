import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage(
      {Key? key,
        this.bgColor,
        this.initials,
        required this.dimensions,
        this.margin,
        this.hasBorder})
      : super(key: key);

  final Color? bgColor;
  final String? initials;
  final double dimensions;
  final EdgeInsets? margin;
  final bool? hasBorder;

  @override
  Widget build(BuildContext context) {

      return Container(
        width: dimensions,
        height: dimensions,
        margin: (margin == null) ? const EdgeInsets.all(0) : margin,
        padding: (dimensions > 100)
            ? const EdgeInsets.all(15)
            : ((dimensions > 35)
            ? const EdgeInsets.all(10)
            : (dimensions > 25)
            ? const EdgeInsets.all(5)
            : const EdgeInsets.all(5)),
        decoration: (hasBorder != null && hasBorder == true)
            ? BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
          border: Border.all(
            color: Colors.white,
            width: 4,
          ),
        )
            : BoxDecoration(
          shape: BoxShape.circle,
          color: bgColor,
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Center(
            child: Text(
              initials!.toUpperCase(),
            ),
          ),
        ),
      );

  }
}
