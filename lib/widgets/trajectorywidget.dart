import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TrajectoryData extends StatefulWidget {
  final List<FlSpot> data;

  const TrajectoryData({super.key, required this.data});

  @override
  State<TrajectoryData> createState() => _TrajectoryData();
}

class _TrajectoryData extends State<TrajectoryData> {

  double getAvgSpending(){
    double sum = 0;
    for (var element in widget.data) {
      sum += element.y;
    }
    double res = sum / widget.data.length;
    return res.roundToDouble();
  }

  @override
  Widget build(BuildContext context){
    double avgspending = getAvgSpending();
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
                    maxY: 10000,
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
                  Text("$avgspending /day"),
                ],
              )
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, top: 5),
              child: const Row(
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
                  Text("10 days")
                ],
              )
            )
          ],
        ),
      )
    );
  }
}