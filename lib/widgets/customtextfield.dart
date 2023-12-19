

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget{
  final String topText;
  final TextEditingController controller;
  final String inBoxText;
  final Icon icon;
  double width;
  double height;
  Function() function;
  bool readOnly;
  TextInputType keyboardType;

  CustomTextField({
    super.key,
    required this.topText,
    required this.controller,
    required this.inBoxText,
    required this.icon,
    required this.function,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context){
    List<TextInputFormatter> formatter = [];
    if (keyboardType == TextInputType.number) {
      formatter = <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ];
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topText,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: "Montserrat"
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            keyboardType: keyboardType,
            inputFormatters: formatter,
            controller: controller,
            readOnly: readOnly,
            decoration: InputDecoration(
              icon: icon,
              border: InputBorder.none,
              hintText: inBoxText,
              hintStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18,
              ),
              contentPadding: EdgeInsets.only(left: 10),
            ),
            onTap: function,
          ),
        ),
      ],
    );
  }
}