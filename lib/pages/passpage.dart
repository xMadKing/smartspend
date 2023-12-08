import 'package:flutter/material.dart';
import 'package:smartspend/widgets/numpad.dart';
import 'package:smartspend/backend/user.dart';
import 'package:smartspend/widgets/navbar.dart';

class PassPage extends StatefulWidget {
  final TextEditingController controller = TextEditingController();
  final User client;

  PassPage({super.key, required this.client});

  @override
  State<PassPage> createState() => _PassPageState();
}

class _PassPageState extends State<PassPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF1E2038),
                  Color.fromARGB(255, 26, 26, 42),
                ],
              )
          ),
          child: Stack(
            children: [
              const Align(
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
              Align(
                alignment: const Alignment(-0.9,-0.9),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
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
              Container(
                padding: const EdgeInsets.only(top: 300),
                  child: Stack(
                    children: [
                      Align(
                        alignment: const Alignment(0,0),
                        child: NumpadWidget(
                          controller: widget.controller,
                          pin: widget.client.passcode,
                          setPin: (str){},
                          register: false,
                          route: MaterialPageRoute(builder: (context) => NavBar(client: widget.client)),
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



