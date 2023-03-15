import 'package:flutter/material.dart';


class IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconText({
    required this.icon,
    required this.text,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 15,),
        const SizedBox(width: 5,),
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 15),),
        )
      ],
    );
  }
}