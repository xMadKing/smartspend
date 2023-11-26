import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartspend/pages/homepage.dart';

class NumpadWidget extends StatefulWidget{
  final TextEditingController controller;
  int dotsNumber = 0;
  final String pin;
  double buttonHeight = 0;

  NumpadWidget({super.key, required this.controller, required this.pin});

  @override
  State<NumpadWidget> createState() => _NumpadWidget();
}

class _NumpadWidget extends State<NumpadWidget>{

  void _update(_dotsNumber){
    setState(() => widget.dotsNumber = _dotsNumber);
  }

  @override
  Widget build(BuildContext context){
    widget.buttonHeight = MediaQuery.of(context).size.width * 0.2;
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        children: [
          InputDots(dotsNumber: widget.dotsNumber),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: 1,
                height: widget.buttonHeight,
                width: widget.buttonHeight,
                controller: widget.controller,
                update: _update,
                pin: widget.pin,
              ),
              NumberButton(
                number: 2,
                height: widget.buttonHeight,
                width: widget.buttonHeight,
                controller: widget.controller,
                update: _update,
                pin: widget.pin,
              ),
              NumberButton(
                number: 3,
                height: widget.buttonHeight,
                width: widget.buttonHeight,
                controller: widget.controller,
                update: _update,
                pin: widget.pin,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: 4,
                height: widget.buttonHeight,
                width: widget.buttonHeight,
                controller: widget.controller,
                update: _update,
                pin: widget.pin,
              ),
              NumberButton(
                number: 5,
                height: widget.buttonHeight,
                width: widget.buttonHeight,
                controller: widget.controller,
                update: _update,
                pin: widget.pin,
              ),
              NumberButton(
                number: 6,
                height: widget.buttonHeight,
                width: widget.buttonHeight,
                controller: widget.controller,
                update: _update,
                pin: widget.pin,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: 7,
                height: widget.buttonHeight,
                width: widget.buttonHeight,
                controller: widget.controller,
                update: _update,
                pin: widget.pin,
              ),
              NumberButton(
                number: 8,
                height: widget.buttonHeight,
                width: widget.buttonHeight,
                controller: widget.controller,
                update: _update,
                pin: widget.pin,
              ),
              NumberButton(
                number: 9,
                height: widget.buttonHeight,
                width: widget.buttonHeight,
                controller: widget.controller,
                update: _update,
                pin: widget.pin,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: 10,
                height: widget.buttonHeight+10,
                width: widget.buttonHeight+10,
                controller: widget.controller,
                update: _update,
                pin: widget.pin,
              ),
              NumberButton(
                number: 0,
                height: widget.buttonHeight,
                width: widget.buttonHeight,
                controller: widget.controller,
                update: _update,
                pin: widget.pin,
              ),
              NumberButton(
                number: 11,
                height: widget.buttonHeight+10,
                width: widget.buttonHeight+10,
                controller: widget.controller,
                update: _update,
                pin: widget.pin,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final int number;
  String buttonText = "";
  final double width;
  final double height;
  final TextEditingController controller;
  final ValueChanged<int> update;
  String pin;

  NumberButton({super.key, required this.number, required this.height,
  required this.width, required this.controller, required this.update,
    required this.pin});

  Widget build(BuildContext context){
    if (number == 10) {buttonText = "ENT";}
    else if (number == 11) {buttonText = "≪";}
    else {buttonText = "$number";}
    return Container(
      height: height,
      width: width,
      child: TextButton(
        onPressed: () {
          if(number == 11){
            controller.text = controller.text.substring(0, controller.text.length-1);
          } else if (number == 10) {
            print(controller.text);
          } else {
            controller.text += number.toString();
          }
          update(controller.text.length);
          if(controller.text ==  pin) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (controller.text.length >= 4) {
            controller.text = "";
            update(controller.text.length);
            SystemSound.play(SystemSoundType.alert);
          }
        },

        child: Text(
          buttonText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
            color: Colors.white70,
            fontSize: 30
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

class InputDots extends StatefulWidget{
  int dotsNumber;
  List<IconData> icons = [];
  List<Color> colors = [];

  InputDots({super.key, required this.dotsNumber});

  @override
  State<InputDots> createState() => _InputDots();
}

class _InputDots extends State<InputDots>{

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 4; i++){
      if (i < widget.dotsNumber){
        widget.icons.add(Icons.circle);
        widget.colors.add(Colors.orange);
        continue;
      }
      widget.icons.add(Icons.circle_outlined);
      widget.colors.add(Colors.white70);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          widget.icons[0],
          color: widget.colors[0],
          size: 10,
        ),
        Icon(
          widget.icons[1],
          color: widget.colors[1],
          size: 10,
        ),
        Icon(
          widget.icons[2],
          color: widget.colors[2],
          size: 10,
        ),
        Icon(
          widget.icons[3],
          color: widget.colors[3],
          size: 10,
        )
      ]
    );
  }
}