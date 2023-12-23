import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:smartspend/backend/user.dart';

class TrajectoryData extends StatefulWidget {
  final List<FlSpot> data;
  final User client;

  const TrajectoryData({super.key, required this.data, required this.client});

  @override
  State<TrajectoryData> createState() => _TrajectoryData();
}

class _TrajectoryData extends State<TrajectoryData> {

  double getMax(){
    List<double> tmp = [];
    for(int i = 0; i < widget.data.length; i++){
      tmp.add(widget.data[i].y);
    }
    tmp.sort();
    return tmp.last;
  }

  int getDaysLeft(){
    double spendingPerDay = getAvgSpending();
    double budget = widget.client.monthlyIncome.toDouble();
    double currentSpending = 0;
    for(int i = 0; i < widget.data.length; i++){
      currentSpending += widget.data[i].y;
    }
    double daysLeft;
    try {
      daysLeft = (budget-currentSpending)/spendingPerDay;
      daysLeft.round();
    } catch (e){
      daysLeft = 0;
    }

    return daysLeft.toInt();
  }

  double getAvgSpending(){
    double sum = 0;
    int date = DateTime.now().month.toInt();
    for(int i = 0; i < date; i++){
      sum += widget.data[i].y;
    }
    double res = sum / date;
    return res.roundToDouble();
  }

  @override
  Widget build(BuildContext context){
    double avgSpending = getAvgSpending();
    int daysLeft = getDaysLeft();
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 1.05,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  child: const Text(
                      "Monthly spending trajectory",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width:  MediaQuery.of(context).size.height * 0.5,
              height: MediaQuery.of(context).size.height * 0.4,
              child: LineChart(
                LineChartData(
                    titlesData: const FlTitlesData(
                      show: true,
                      topTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          )
                      ),
                      rightTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          )
                      ),
                      leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          )
                      ),
                    ),
                    minX: 0,
                    maxX: 30,
                    minY: 0,
                    maxY: getMax(),
                    gridData: const FlGridData(
                      show: true,
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(
                          color: Colors.black26,
                          width: 2,
                          style: BorderStyle.solid
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: widget.data,
                        isCurved: true,
                        gradient: const LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Color.fromARGB(255, 46, 86, 246),
                            Color.fromARGB(255, 61, 166, 62),
                          ],
                        ),
                        barWidth: 5,
                        belowBarData: BarAreaData(
                          show:  true,
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              const Color.fromARGB(255, 46, 86, 246),
                              const Color.fromARGB(255, 61, 166, 62),
                            ].map((color) => color.withOpacity(0.3)).toList(),
                          ),
                        ),
                      )
                    ]
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, top: 5),
              child: Row(
                children: [
                  const Text(
                      "Average spending:",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w700
                      ),
                  ),
                  const SizedBox(width: 10),
                  Text("$avgSpending /day"),
                ],
              )
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, top: 5),
              child: Row(
                children: [
                  Text(
                    "Projected to run out of money in:",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(width: 10),
                  Text("$daysLeft")
                ],
              )
            )
          ],
        ),
      )
    );
  }
}