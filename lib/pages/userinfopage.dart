import 'dart:math';

import 'package:flutter/material.dart';


class UserInfo extends StatelessWidget{



  @override
  Widget build(BuildContext context){
    return(
      Scaffold(
        body: Stack(
          children: [

            Container(
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
            ),

            Container(
                child: Align(
                  alignment: Alignment(-0.9, -0.8),
                  child: Text(
                    "User Info",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),

            Container(
              child: CardWidget(),
            ),

            Align(child: Profile()),
          ],
        )
      )
    );
  }

}


class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)
        ),
        child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.5,
            child: SingleChildScrollView(
              child: Column(
                children: [ 
                  
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 75),
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextField(
                      //TODO: controller:
                      decoration: InputDecoration(
                        labelText: 'Majed', // TODO: Should be dynamic later
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        contentPadding: EdgeInsets.all(15)
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      'Birthday',
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextField(
                      //TODO: controller:
                      decoration: InputDecoration(
                        labelText: '2000-05-31', // TODO: Should be dynamic later.
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        contentPadding: EdgeInsets.all(15)
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 25),
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[800],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(13)
                      ),
                      onPressed: () {print("hello");}, //TODO
                      child: Text("Save Change"),
                    )
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white
                      ),
                      onPressed: () {print("hello");}, //TODO
                      child: Text("Log out"),
                    )
                  ),
                ],
              ),
            )
        ),
      ),

    );
  }
}

class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 55,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.orange[800], //Orange circle on top of the white one
        child: Text(
          "M", //TODO: Should be dynamic
          style: TextStyle(
            fontSize: 55,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}