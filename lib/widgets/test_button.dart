import 'package:flutter/material.dart';


class TestButton extends StatelessWidget {
  final double height;
  final String text;
  final Function onClick;

  const TestButton({
    required this.height,
    required this.text,
    required this.onClick,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(height / 2)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.red.withOpacity(0.2),
            blurRadius: height / 5,
            offset: Offset(0, height / 5),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red, // Background color
          foregroundColor: Colors.amberAccent, // Text Color (Foreground color)
        ),
        onPressed: () => onClick(),
        child: Text(text, style: const TextStyle(
            fontSize: 14
        ),),
      ),
    );
  }
}