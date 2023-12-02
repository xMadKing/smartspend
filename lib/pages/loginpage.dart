import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smartspend/pages/registerpage.dart';


class LoginPage extends StatefulWidget{
  LoginPage({super.key});
  bool visible = true;

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage>{

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
              child: Text(
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
                margin: EdgeInsets.only(top: 70),
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
                  child: Text(
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
                margin: EdgeInsets.only(top: 35),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
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
              margin: EdgeInsets.only(top: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text(
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