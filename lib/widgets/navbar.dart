import 'package:flutter/material.dart';
import 'package:smartspend/pages/addexpense.dart';
import 'package:smartspend/pages/homepage.dart';
import 'package:smartspend/backend/user.dart';
import 'package:smartspend/pages/myaccountpage.dart';


class NavBar extends StatefulWidget {
  User client;
  NavBar({super.key, required this.client});

  @override
  State<NavBar> createState() => _NavBar();
}

class _NavBar extends State<NavBar>{
  Color bg_color = Color(0xFF1E2038);
  int index = 0;
  late List<Widget> options = <Widget>[
    HomePage(
      client: widget.client,
    ),
    AddExpensePage(),
    MyAccount(),
  ];

  void onTappedItem(int idx) {
    setState(() {
      index = idx;
      if(index == 2 || index == 1) {
        bg_color = Colors.white;
      }
      else {
        bg_color = Color(0xFF1E2038);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: options.elementAt(index),
      ),
      bottomNavigationBar: Container(
          color: bg_color,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20)
            ),
            child: BottomNavigationBar(
              backgroundColor: const Color(0xFF41466A),
              enableFeedback: true,
              showUnselectedLabels: false,
              selectedLabelStyle: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold
              ),
              items: const <BottomNavigationBarItem> [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined, size: 30),
                    label: "Home"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add, size: 30),
                    label: 'Add Expense'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline, size: 30),
                    label: 'Account'
                ),
              ],
              currentIndex: index,
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.deepOrangeAccent,
              onTap: onTappedItem,
            ),
          )
      )
    );
  }
}