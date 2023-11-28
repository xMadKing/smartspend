import 'package:flutter/material.dart';
import 'package:smartspend/widgets/numpad.dart';

class PassPage extends StatefulWidget {
  final TextEditingController controller = TextEditingController();
  final String pin = "1234";

  PassPage({super.key});

  @override
  State<PassPage> createState() => _PassPageState();
}

class _PassPageState extends State<PassPage>{

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
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "BACK",
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: "Montserrat"
                      ),
                    ),
                  )
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 300),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment(0,0),
                        child: NumpadWidget(
                          controller: widget.controller,
                          pin: widget.pin,
                        )
                      ),
                    ],
                  )
              ),
            ],
          )
      ),
    );
  }
}



