import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final VoidCallback? onPressed;
  final double borderRadius;
  final Color? color;
  final String lable;
  final Color? lableColor;
  final double lableSize;
  final double padding;
  final double width;
  final double height;

  const ElevatedButtonCustom({
    super.key,
    required this.onPressed,
    required this.lable,
    this.borderRadius = 24,
    this.color,
    this.lableColor,
    this.lableSize = 20,
    this.padding = 10,
    this.width = 200,
    this.height = 66,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)),
            backgroundColor: Colors.green),
            
        child: Text(
          lable,
          style: TextStyle(
            fontSize: 20,
            color: lableColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
