import 'package:flutter/material.dart';
import 'package:smartspend/pages/loginpage.dart';
import 'package:smartspend/pages/passpage.dart';
import 'package:smartspend/backend/user.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({super.key, required this.client});

  final User client;

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
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
          children: <Widget>[
            Stack(
              children: [
                Align(
                  alignment: const Alignment(0,-.7),
                  child: FadeTransition(
                    opacity: _animation,
                    child: const Text(
                      'Smart',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment(0,-.57),
                  child: Text(
                    'Spend',
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              ]
            ),
            Container(
              alignment: const Alignment(0,0),
              child: Image.asset('assets/logo.png'),
              ),
            Align(
              alignment: const Alignment(0, 0.6),
              child: Container(
                decoration: const BoxDecoration(
                  color:  Color(0xFF1E2038),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                    color: Colors.white,
                    spreadRadius: 5,
                  )]
                ),
                height: 40,
                child: TextButton(
                  onPressed: () async {
                    if(widget.client.newUser == 0) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage(
                            client: widget.client,
                          )));
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PassPage(
                            client: widget.client,
                          )));
                    }
                  },
                  child: const Text(
                    'Spend Smart, Spend Wise',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
