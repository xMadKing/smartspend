import 'package:flutter/material.dart';

class CustomizedBackButton extends StatelessWidget{
  const CustomizedBackButton({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    //old implementation used expanded, expanded should not be used inside a stack.
    return Row(
      children: [
        Container(
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        Text(
          "BACK",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
            fontFamily: 'Montserrat',
            color: Colors.white
         ),
        )
      ],
    );
  }
}
