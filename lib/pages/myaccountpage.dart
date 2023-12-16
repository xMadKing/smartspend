import 'package:flutter/material.dart';
import 'package:smartspend/widgets/cardrowwidget.dart';
import 'package:smartspend/pages/userinfopage.dart';



class MyAccount extends StatelessWidget{



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

            Align(
              alignment: Alignment(0, -0.8),
              child: Container(
                child: Image.asset('assets/creditcard.png')
              ),
            ),

            Container(
              child: CardWidget(),
            )
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
                  CardRowWidget(name: "Settings", icon: Icons.settings, icon_color: Colors.orange[800]!,),
                  GestureDetector(onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfo()));}, 
                    child: CardRowWidget(name: "User Info", icon: Icons.account_circle)),
                  CardRowWidget(name: "Cards", icon: Icons.credit_card),
                  CardRowWidget(name: "Notifications", icon: Icons.notifications_outlined, icon_color: Colors.black, slider: true,),
                  CardRowWidget(name: "Change PIN", icon: Icons.key)
                ],
              ),
            )
        ),
      ),
    );
  }
}