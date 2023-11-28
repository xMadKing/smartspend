import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
  ];
  int dataAvailable = 0;
  Icon tosButton = Icon(Icons.circle_outlined, size: 20);
  bool tosIsAgreed = false;

  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage>{

  bool isActivated() {
    if (widget.controllers[0].text.isNotEmpty
        && widget.controllers[1].text.isNotEmpty) {
      return true;
    }
    return false;
  }

  void updateTos(){
    if (widget.tosIsAgreed == true) {
      widget.tosIsAgreed = false;
    }
    else {
      widget.tosIsAgreed = true;
    }
  }

  Color getButtonColor() {
    if (isActivated()) {
      return Colors.deepOrangeAccent;
    }
    return Colors.grey.shade700;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            )),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.25,
                  bottom: 40,
                ),
                alignment: Alignment.center,
                child: Text(
                  "REGISTER",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: widget.controllers[0],
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person
                    ),
                    border: InputBorder.none,
                    hintText: "Nickname",
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                    ),
                    contentPadding: EdgeInsets.only(left: 10),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  readOnly: true,
                  controller: widget.controllers[1],
                  onTap: () async{
                    DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (date != null){
                      setState(() {
                          widget.controllers[1].text =
                              date.day.toString()
                              +"/"+ date.month.toString()
                              +"/"+ date.year.toString();
                      });
                    }
                  },
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.date_range_rounded,
                    ),
                    border: InputBorder.none,
                    hintText: "Birth-date",
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                    ),
                    contentPadding: EdgeInsets.only(left: 10),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                    height: MediaQuery.of(context).size.height * 0.1
                  ),
                  IconButton(
                    onPressed: () {
                      setState((){
                        if(widget.tosIsAgreed == true) {
                          updateTos();
                          widget.tosButton = Icon(
                            Icons.circle_outlined,
                            color: Colors.grey,
                            size: 20,
                          );
                        } else {
                          updateTos();
                          widget.tosButton = Icon(
                            Icons.check_circle,
                            color: Colors.deepOrangeAccent,
                            size: 20,
                          );
                        }
                      });
                    },
                    icon: widget.tosButton,
                  ),
                  Text(
                    "I agree to the",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 3),
                  Text(
                    "terms and conditions",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      color: Colors.deepOrangeAccent
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 70),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                decoration: BoxDecoration(
                  color: getButtonColor(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: !isActivated() ? null : () {
                  },
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Montserrat",
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Montserrat",
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
