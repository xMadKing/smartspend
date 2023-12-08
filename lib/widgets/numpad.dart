import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphic/graphic.dart';
import 'package:smartspend/pages/homepage.dart';

class NumpadWidget extends StatefulWidget{
  final TextEditingController controller;
  int dotsNumber = 0;
  final String pin;
  double buttonHeight = 0;
  MaterialPageRoute route;
  bool register = false;
  final ValueChanged<Map<String, dynamic>> setPin;


  NumpadWidget({super.key, required this.controller, required this.pin,
    required this.route, required this.register, required this.setPin});

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
                setPin: widget.setPin,
                route: widget.route,
                pin: widget.pin,
                register: widget.register,
              ),
              NumberButton(
                number: 2,
                height: widget.buttonHeight,
                width: widget.buttonHeight,
                controller: widget.controller,
                update: _update,
                setPin: widget.setPin,
                route: widget.route,
                pin: widget.pin,
                register: widget.register,
              ),
              NumberButton(
                number: 3,
                height: widget.buttonHeight,
                width: widget.buttonHeight,
                controller: widget.controller,
                update: _update,
                setPin: widget.setPin,
                route: widget.route,
                pin: widget.pin,
                register: widget.register,
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
                setPin: widget.setPin,
                route: widget.route,
                pin: widget.pin,
                register: widget.register,
              ),
              NumberButton(
                number: 5,
                height: widget.buttonHeight,
                width: widget.buttonHeight,
                controller: widget.controller,
                update: _update,
                setPin: widget.setPin,
                route: widget.route,
                pin: widget.pin,
                register: widget.register,
              ),
              NumberButton(
                number: 6,
                height: widget.buttonHeight,
                width: widget.buttonHeight,
                controller: widget.controller,
                update: _update,
                setPin: widget.setPin,
                route: widget.route,
                pin: widget.pin,
                register: widget.register,
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
                route: widget.route,
                setPin: widget.setPin,
                update: _update,
                pin: widget.pin,
                register: widget.register,
              ),
              NumberButton(
                number: 8,
                height: widget.buttonHeight,
                width: widget.buttonHeight,
                controller: widget.controller,
                route: widget.route,
                setPin: widget.setPin,
                update: _update,
                pin: widget.pin,
                register: widget.register,
              ),
              NumberButton(
                number: 9,
                height: widget.buttonHeight,
                width: widget.buttonHeight,
                controller: widget.controller,
                update: _update,
                setPin: widget.setPin,
                route: widget.route,
                pin: widget.pin,
                register: widget.register,
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
                setPin: widget.setPin,
                route: widget.route,
                pin: widget.pin,
                register: widget.register,
              ),
              NumberButton(
                number: 0,
                height: widget.buttonHeight,
                width: widget.buttonHeight,
                controller: widget.controller,
                update: _update,
                setPin: widget.setPin,
                route: widget.route,
                pin: widget.pin,
                register: widget.register,
              ),
              NumberButton(
                number: 11,
                height: widget.buttonHeight+10,
                width: widget.buttonHeight+10,
                controller: widget.controller,
                update: _update,
                setPin: widget.setPin,
                route: widget.route,
                pin: widget.pin,
                register: widget.register,
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
  final ValueChanged<Tuple> setPin;
  final MaterialPageRoute route;
  final bool register;
  String pin;
  bool enabled = true;

  NumberButton({super.key, required this.number, required this.height,
  required this.width, required this.controller, required this.update,
    required this.pin, required this.route, required this.register,
  required this.setPin});

  Widget build(BuildContext context){
    if (number == 10) {
      if (register){
        buttonText = "ENT";
      } else {
        buttonText = "";
        enabled = false;
      }
    }
    else if (number == 11) {buttonText = "≪";}
    else {buttonText = "$number";}
    return Container(
      height: height,
      width: width,
      child: TextButton(
        onPressed: !enabled ? null : () {
          if(number == 11){
            controller.text = controller.text.substring(0, controller.text.length-1);
          } else if (number == 10) {
            if(controller.text.length == 4) {
              if (pin != ""){
                if (controller.text != pin) {
                  setPin({
                    "pin" : "",
                    "text" : "Did not match! Try again",
                    "confirmed" : false,
                  });
                  update(0);
                  controller.text = '';
                } else {
                  setPin({
                    "pin" : pin,
                    "text" : "Confirmed!",
                    "confirmed" : true,
                  });
                  Navigator.push(context, route);
                }
              } else {
                pin = controller.text;
                setPin({
                  "pin" : pin,
                  "text" : "Re-enter your passcode",
                  "confirmed" : false,
                });
                controller.text = "";
              }
            } else {
              print(controller.text);
            }
          } else {
            controller.text += number.toString();
            update(controller.text.length);
          }
          if(!register){
            if(controller.text ==  pin) {
              Navigator.push(context, route);
            } else if (controller.text.length >= 4) {
              controller.text = "";
              update(controller.text.length);
              SystemSound.play(SystemSoundType.alert);
            }
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
            color: Colors.white70,
            fontSize: 30
          ),
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