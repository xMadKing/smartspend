import 'package:flutter/material.dart';
import 'package:smartspend/pages/setcodepage.dart';
import 'package:smartspend/backend/user.dart';


class RegisterPage extends StatefulWidget {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
  ];
  final User client;
  int dataAvailable = 0;
  Icon tosButton = const Icon(Icons.circle_outlined, size: 20);
  bool tosIsAgreed = false;
  bool loadTOS = false;
  String tos = "Last Revised: December 16, 2013\n"
      "Welcome to www.lorem-ipsum.info.\n\n"
      "This site is provided as a service to our visitors "
      "and may be used for informational purposes only. "
      "Because the Terms and Conditions contain legal obligations, "
      "please read them carefully.\n\n "
      "1. YOUR AGREEMENT By using this Site, you agree to be bound by, "
      "and to comply with, these Terms and Conditions. "
      "If you do not agree to these Terms and Conditions,"
      " please do not use this site. PLEASE NOTE: "
      "We reserve the right, at our sole discretion, to change,"
      " modify or otherwise alter these Terms and Conditions at any time. "
      "Unless otherwise indicated, amendments will become effective immediately. "
      "Please review these Terms and Conditions periodically."
      "Your continued use of the Site following the posting of "
      "changes and/or modifications will constitute your acceptance of the "
      "revised Terms and Conditions and the reasonableness of these standards "
      "for notice of changes. For your information, this page was last updated "
      "as of the date at the top of these terms and conditions.\n"
      "2. PRIVACY Please review our Privacy Policy, which also governs your "
      "visit to this Site, to understand our practices.\n"
      "3. LINKED SITES This Site may contain links to other "
      "independent third-party Web sites (\"Linked Sites\")."
      " These Linked Sites are provided solely as a convenience to our visitors."
      " Such Linked Sites are not under our control, and we are not responsible"
      " for and does not endorse the content of such Linked Sites, including any"
      " information or materials contained on such Linked Sites. You will need "
      "to make your own independent judgment regarding your interaction with "
      "these Linked Sites.";

  RegisterPage({super.key, required this.client});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage>{

  bool isActivated() {
    if (widget.controllers[0].text.isNotEmpty
        && widget.controllers[1].text.isNotEmpty
        && widget.tosIsAgreed) {
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF1E2038),
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
                  child: const Text(
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
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: widget.controllers[0],
                    decoration: const InputDecoration(
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
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.all(5),
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
                          "${date.day}/${date.month}/${date.year}";
                        });
                      }
                    },
                    decoration: const InputDecoration(
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
                            widget.tosButton = const Icon(
                              Icons.circle_outlined,
                              color: Colors.grey,
                              size: 20,
                            );
                          } else {
                            updateTos();
                            widget.tosButton = const Icon(
                              Icons.check_circle,
                              color: Colors.deepOrangeAccent,
                              size: 20,
                            );
                          }
                        });
                      },
                      icon: widget.tosButton,
                    ),
                    const Text(
                      "I agree to the",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            widget.loadTOS = true;
                          });
                        },
                        child: const Text(
                          "terms and conditions",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.deepOrangeAccent,
                              color: Colors.deepOrangeAccent
                          ),
                        )
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  decoration: BoxDecoration(
                    color: getButtonColor(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: !isActivated() ? null : () {
                      widget.client.name = widget.controllers[0].text;
                      widget.client.birthDate = widget.controllers[1].text;
                      Navigator.push(context, MaterialPageRoute(builder: (context)
                      => SetCodePage(
                        client: widget.client,
                      )));
                    },
                    child: const Text(
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
                  margin: const EdgeInsets.only(top: 20),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Montserrat",
                        color: Colors.grey,
                        decorationColor: Colors.grey,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Visibility(
                visible: widget.loadTOS,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.loadTOS = false;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        top:  MediaQuery.of(context).size.height * 0.1),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.grey.shade700,
                        )]
                    ),
                    child: SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.all(40),
                          child: Text(
                            widget.tos,
                            style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12,
                            ),
                          ),
                        )
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
