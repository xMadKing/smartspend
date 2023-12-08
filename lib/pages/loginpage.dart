import 'package:flutter/material.dart';
import 'package:smartspend/pages/registerpage.dart';
import 'package:smartspend/backend/user.dart';



class LoginPage extends StatefulWidget{
  final User client;
  bool visible = true;

  LoginPage({super.key, required this.client});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage>{

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
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.25,
                bottom: 40,
              ),
              alignment: Alignment.center,
              child: const Text(
                "LOGIN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
            Visibility(
              visible: widget.visible,
              child: Container(
                margin: const EdgeInsets.only(top: 70),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      widget.visible = false;
                    });
                  },
                  child: const Text(
                    "Link to Bank Account",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat",
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !widget.visible,
              child: Container(
                margin: const EdgeInsets.only(top: 35),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cancel_sharp,
                      color: Colors.red,
                    ),
                    Text(
                      "We are sorry.",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontStyle: FontStyle.italic,
                        fontSize: 13,
                        color: Colors.black
                      ),
                    ),
                    Text(
                      "This function is not currently supported.",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontStyle: FontStyle.italic,
                          fontSize: 13,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
              )
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(
                    client: widget.client,
                  )));
                },
                child: const Text(
                  "LOGIN MANUALLY",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}