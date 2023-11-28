import 'package:flutter/material.dart';
import 'package:smartspend/widgets/progress_bar.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:smartspend/widgets/categorywidget.dart';
import 'package:smartspend/pages/monthlybudgetpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  Map<String, double> dataMap = {
    "Entertainment": 1999,
    "Travel/Transport": 1000,
    "Food": 2400,
    "Medical": 400,
  }; //temp data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack (
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
          Center(
              child: GestureDetector(
                onDoubleTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MonthlyBudgetPage()));
                },
                child: Container(
                  child: Align(
                    alignment: Alignment(0, -0.2),
                    child: ProgressBarWidget(
                      width: 0.5,
                      bgColor: const Color(0xFFF5F5F5),
                      barColor: Colors.purple.shade200,
                      barFillColor: Colors.purple.shade900,
                      text: "Monthly Budget",
                    ),
                  ),
                ),
              )
          ),
          Container(
            child: Align(
              alignment: Alignment(-0.9, -0.8),
              child: Text(
                "Home",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
          ),
          Container(
            child: Align(
              alignment:  Alignment(-.9, -0.65),
              child: Text(
                "Hello,",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Container(
            child: Align(
              alignment:  Alignment(-.9, -0.55),
              child: Text(
                "Ahmad",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
            ),
          ),
          Align(
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
                        GestureDetector(
                          onTap: () {
                            print("HELLOTHERE");
                          },
                          child: Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 380,
                              height: 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 20),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Spending by Category",
                                      style: TextStyle(
                                        color: Color(0xFF1E2038),
                                        fontSize: 16,
                                        fontFamily: 'Montserrat',
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                          onPressed: () {
                                          },
                                          icon: Icon(
                                            Icons.keyboard_arrow_right,
                                            size: 25,
                                          )
                                      )
                                  ),
                                ],
                              )
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: PieChart(
                              centerWidget: Text(
                                "4953kr",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              dataMap: this.dataMap,
                              animationDuration: Duration(milliseconds: 500),
                              chartType: ChartType.ring,
                              chartRadius: 170,
                              ringStrokeWidth: 40,
                              chartValuesOptions: ChartValuesOptions(
                                showChartValues: false,
                              ),
                              legendOptions: LegendOptions(
                                showLegends: false,
                              ),
                              colorList: [
                                Colors.green.shade800,
                                Colors.orange.shade800,
                                Colors.blueGrey.shade800,
                                Colors.blue.shade800
                              ],
                            ),
                          ),
                        ),
                        CategoryWidget(
                          name: "Food",
                          color: Colors.green,
                          bgColor: Colors.white,
                          number: 4000,
                          limit: 3500,
                        ),
                        CategoryWidget(
                          name: "Entertainment",
                          color: Colors.orange,
                          bgColor: Colors.white,
                          number: 2400,
                          limit: 3000,
                        ),
                        CategoryWidget(
                          name: "Transportation",
                          color: Colors.blue,
                          bgColor: Colors.white,
                          number: 3344,
                          limit: 3000,
                        ),
                        CategoryWidget(
                          name: "Medical",
                          color: Colors.green,
                          bgColor: Colors.white,
                          number: 599,
                          limit: 1000,
                        )
                      ],
                    ),
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}