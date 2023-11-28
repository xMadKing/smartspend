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
                          FlSpot(0, 1000),
                          FlSpot(1, 2000),
                          FlSpot(2, 4000),
                          FlSpot(3, 5000),
                          FlSpot(4, 3000),
                          FlSpot(5, 500),
                          FlSpot(6, 1000),
                          FlSpot(7, 2500),
                          FlSpot(8, 300),
                          FlSpot(9, 1000),
                          FlSpot(10, 1000),
                          FlSpot(11, 1000),
                          FlSpot(12, 2000),
                          FlSpot(13, 4000),
                          FlSpot(14, 5000),
                          FlSpot(15, 3000),
                          FlSpot(16, 500),
                          FlSpot(17, 1000),
                          FlSpot(18, 2500),
                          FlSpot(19, 300),
                          FlSpot(20, 1000),
                          FlSpot(21, 1000),
                          FlSpot(22, 1000),
                          FlSpot(23, 2000),
                          FlSpot(24, 4000),
                          FlSpot(25, 5000),
                          FlSpot(26, 3000),
                          FlSpot(27, 500),
                          FlSpot(28, 1000),
                          FlSpot(29, 2500),
                          FlSpot(30, 300),
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