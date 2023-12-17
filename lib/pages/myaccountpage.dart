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
                  color: Color(0xFF1E2038),
                ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, left: 20),
                  child: Text(
                    "Account",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: Image.asset(
                              'assets/creditcard.png',
                              fit: BoxFit.cover)
                      ),
                    )
                  ],
                )
              ],
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
            topLeft: Radius.circular(70),
            topRight: Radius.circular(70)
        ),
        child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70),
                  topRight: Radius.circular(70)
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                          spreadRadius: 2,
                          color: Colors.black54,
                          blurRadius: 10,
                        )]
                      ),
                      margin: EdgeInsets.only(top: 30, bottom: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.89,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Icon(
                                  Icons.wallet,
                                  color: Colors.deepOrangeAccent,
                                  size: 60,
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Manage Budget",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    "Manage your budget and categories",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 10,
                                        color: Colors.grey
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.grey.shade500,
                                size: 28,
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                      )
                    )
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              const SizedBox(width: 20),
                              Icon(
                                Icons.settings,
                                color: Colors.deepOrangeAccent,
                                size: 60,
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Settings",
                                    style: TextStyle(
                                      fontSize: 28,
                                    ),
                                  ),
                                  Text(
                                    "Manage personal data & preferences",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => UserInfo()));
                            },
                            child: CardRowWidget(
                                name: "User Info",
                                icon: Icons.account_circle)
                        ),
                        CardRowWidget(
                            name: "Cards",
                            icon: Icons.credit_card
                        ),
                        CardRowWidget(
                          name: "Notifications",
                          icon: Icons.notifications_outlined,
                          icon_color: Colors.black,
                          slider: true,
                        ),
                        CardRowWidget(
                            name: "Change PIN",
                            icon: Icons.key
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}