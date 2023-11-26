import 'package:flutter/material.dart';
import 'package:smartspend/graphcard.dart';

class MonthlyBudgetPage extends StatelessWidget{

  MonthlyBudgetPage({super.key});

  @override
  Widget build(BuildContext context){
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
                )
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50, left: 20),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Monthly Budget",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 32,
                            fontFamily: 'Montserrat',
                            color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GraphCard(
                      cardName: "Daily spending Last 7 days spending",
                      barColor: Colors.blue,
                      dataMap: {
                        "Monday" : 3660,
                        "Tuesday" : 530,
                        "Wednesday" : 1500,
                        "Thursday" : 300,
                        "Friday" : 100,
                        "Saturday" : 720,
                        "Sunday" : 200,
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GraphCard(
                      cardName: "Daily spending on Food",
                      barColor: Colors.deepPurpleAccent,
                      dataMap: {
                        "Monday" : 300,
                        "Tuesday" : 500,
                        "Wednesday" : 4000,
                        "Thursday" : 600,
                        "Friday" : 1304,
                        "Saturday" : 729,
                        "Sunday" : 209,
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GraphCard(
                      cardName: "Daily spending on Food",
                      barColor: Colors.amber.shade800,
                      dataMap: {
                        "Monday" : 310,
                        "Tuesday" : 760,
                        "Wednesday" : 900,
                        "Thursday" : 459,
                        "Friday" : 99,
                        "Saturday" : 770,
                        "Sunday" : 214,
                      },
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}