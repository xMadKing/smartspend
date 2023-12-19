import 'package:flutter/material.dart';

class NewCatButton extends StatelessWidget {
  final String buttonText;
  final Color colorButton; // New parameter for button color
  final Color colorText; // New parameter for text color
  final double widthButton; // New parameter for button size
  final double heightButton;
  final double buttonBorder;
  final String? fontFamily;
  final VoidCallback onPressed;

  const NewCatButton({super.key, 
    this.buttonText = "Done", 
    this.colorButton = const Color(0xFFE76201),
    this.colorText = const Color(0xFFFFFFFF),
    this.widthButton = 330,
    this.heightButton = 48,
    this.buttonBorder = 10,
    this.fontFamily = 'Montserrat',
    required this.onPressed,
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


