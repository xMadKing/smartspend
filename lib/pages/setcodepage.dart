import 'package:flutter/material.dart';
import 'package:smartspend/widgets/numpad.dart';
import 'package:smartspend/pages/homepage.dart';
import 'package:smartspend/backend/user.dart';
import 'package:smartspend/backend/wyrm/database.dart';


class SetCodePage extends StatefulWidget {
  final TextEditingController controller = TextEditingController();
  String displayText = "Choose a passcode";
  final User client;
  String pin = "";


  SetCodePage({super.key, required this.client});

  @override
  State<SetCodePage> createState() => _SetCodePage();
}

class _SetCodePage extends State<SetCodePage>{

  Future<void> setPin(Map<String, dynamic> data) async {
    setState(() {
      widget.pin = data['pin'];
      widget.displayText = "Re-enter passcode";
    });
    if(data['confirmed']){
      widget.client.passcode = data['pin'];
      widget.client.newUser = 1;
      await updateDB(widget.client);
    }
  }

  Future<void> updateDB(User client) async{
    DB database = DB(name: "wyrm");
    await database.updateEntryInTable('user', "userID", 1, client);
  }

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
              Align(
                alignment: const Alignment(0,-0.4),
                child: Text(
                  widget.displayText,
                  style: const TextStyle(
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
                            pin: widget.pin,
                            register: true,
                            setPin: setPin,
                            route: MaterialPageRoute(builder: (context) => HomePage(
                              client: widget.client,
                            )),
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



