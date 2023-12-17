import 'package:flutter/material.dart';

class CustomizedBackButton extends StatelessWidget{
  const CustomizedBackButton({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.transparent,
      icon: const Expanded(
          child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new, color: Color(0xffFFFFFF), size: 15),
                SizedBox(width: 5),
                Text('Back', style: TextStyle(fontFamily: 'Montserrat', fontSize: 15, color: Color(0xffFFFFFF)))
              ]
          )
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
