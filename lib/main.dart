import 'package:flutter/material.dart';
import 'package:smartspend/passpage.dart';

void main() {
  runApp(MaterialApp(
    home: BoardingPage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.green),
  ));
}

class BoardingPage extends StatelessWidget {
  BoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'), //temp home page, samer change code here
      ),
      body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PassPage()));
            },
            child: Text("Let's get started!"),
          )
      ),
    );
  }
}


