import 'package:flutter/material.dart';

class AddCatButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color colorButton; // New parameter for button color
  final Color colorText; // New parameter for text color
  final double widthButton; // New parameter for button size
  final double heightButton;
  final double buttonBorder;
  final String? fontFamily;

  AddCatButton({
    required this.buttonText, 
    required this.onPressed,
    this.colorButton = const Color(0xFF535986),
    this.colorText = const Color(0xFFFFFFFF),
    this.widthButton = 191.06,
    this.heightButton = 44,
    this.buttonBorder = 15,
    this.fontFamily,
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorButton,
        minimumSize: Size(widthButton, heightButton),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonBorder),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: colorText,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w600
          ),
      ),
    );
  }
}


