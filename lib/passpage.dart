import 'package:flutter/material.dart';
import 'package:numpad/numpad.dart';
import 'package:smartspend/main.dart';

class PassPage extends StatefulWidget {
  const PassPage({super.key});

  @override
  State<PassPage> createState() => _PassPageState();
}

class _PassPageState extends State<PassPage>{
  String pin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 21, 7, 52),
                  Color.fromARGB(255, 26, 26, 42),
                ],
              )
          ),
          child: Stack(
            children: [
              Container(
                child: Align(
                  alignment: Alignment(0,-0.4),
                  child: Text(
                    "Enter Password",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        color: Colors.white70,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment(-0.9,-0.9),
                  child: Text(
                    "BACK",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: "Montserrat"
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                  child: Align(
                    alignment: Alignment(0,0.5),
                      child: NumPad(
                        backgroundColor: Colors.transparent,
                        onTap: (val) {
                          if (val == 99) {
                            setState(() {
                              pin = pin.substring(0, pin.length -1);
                            });
                          } else {
                            setState(() {
                              pin += "$val";
                            });
                          }
                          print(pin);
                        },
                      )
                  )
              )
            ],
          )
      ),
    );
  }
}



