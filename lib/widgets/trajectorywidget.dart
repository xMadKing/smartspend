import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TrajectoryData extends StatefulWidget {
  final List<FlSpot> data;

  const TrajectoryData({super.key, required this.data});

  @override
  State<TrajectoryData> createState() => _TrajectoryData();
}

class _TrajectoryData extends State<TrajectoryData> {

  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: Text(
                      "Monthly spending trajectory",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width:  MediaQuery.of(context).size.height * 0.425,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: LineChart(
                    LineChartData(
                      titlesData: FlTitlesData(
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
                      maxX: 11,
                      minY: 0,
                      maxY: 10000,
                      gridData: FlGridData(
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
                          spots: [
                            FlSpot(0, 2000),
                            FlSpot(1, 3000),
                            FlSpot(2, 4500),
                            FlSpot(3, 5000),
                            FlSpot(4, 6000),
                            FlSpot(5, 7700),
                            FlSpot(6, 8200),
                            FlSpot(7, 9000),
                            FlSpot(8, 5000),
                            FlSpot(9, 2000),
                            FlSpot(10, 2100),
                            FlSpot(11, 5500),
                          ],
                          isCurved: true,
                          gradient: LinearGradient(
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
                                Color.fromARGB(255, 46, 86, 246),
                                Color.fromARGB(255, 61, 166, 62),
                              ].map((color) => color.withOpacity(0.3)).toList(),
                            ),
                          ),
                        )
                      ]
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}