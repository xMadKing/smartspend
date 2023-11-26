import 'package:flutter/material.dart';
import 'package:smartspend/widgets/graphcard.dart';
import 'package:smartspend/widgets/trajectorywidget.dart';
import 'package:fl_chart/fl_chart.dart';


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
                      cardName: "Daily spending over last 7 days",
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TrajectoryData(
                       data: [
                          FlSpot(0, 1),
                          FlSpot(1, 3),
                          FlSpot(2, 10),
                          FlSpot(3, 7),
                          FlSpot(4, 12),
                          FlSpot(5, 13),
                          FlSpot(6, 17),
                          FlSpot(7, 15),
                          FlSpot(8, 20),
                        ],
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