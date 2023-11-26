import 'package:flutter/material.dart';
import 'dart:math';

class BarChart extends StatelessWidget{
  final double width;
  final Color barColor;
  final Map<String, double> dataMap;
  List<double> values = [];

  BarChart({super.key, required this.dataMap, required this.width, required this.barColor});

  double normalizeData(){
    List<String> keys = dataMap.keys.toList();
    List<double> vals = dataMap.values.toList();
    vals.sort();
    double min = 0;
    double max = vals[vals.length-1];
    for(int i = 0; i < keys.length; i++){
      values.add(((dataMap[keys[i]] !- min) / (max - min)));
    }
    return max;
  }

  @override
  Widget build(BuildContext context) {
    List<String> keys = dataMap.keys.toList();
    double max = normalizeData();
    return Container(
      width: width,
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)
                          ),
                          color: barColor,
                        ),
                        width: 30,
                        height: values[0] * 140,
                      ),
                      Container(
                        child: Text(keys[0].substring(0, 3),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)
                          ),
                          color: barColor,
                        ),
                        width: 30,
                        height: values[1] * 140,
                      ),
                      Container(
                        child: Text(keys[1].substring(0, 3),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)
                          ),
                          color: barColor,
                        ),
                        width: 30,
                        height: values[2] * 140,
                      ),
                      Container(
                        child: Text(keys[2].substring(0, 3),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)
                          ),
                          color: barColor,
                        ),
                        width: 30,
                        height: values[3] * 140,
                      ),
                      Container(
                        child: Text(keys[3].substring(0, 3),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)
                          ),
                          color: barColor,
                        ),
                        width: 30,
                        height: values[4] * 140,
                      ),
                      Container(
                        child: Text(keys[4].substring(0, 3),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)
                          ),
                          color: barColor,
                        ),
                        width: 30,
                        height: values[5] * 140,
                      ),
                      Container(
                        child: Text(
                          keys[5].substring(0, 3),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)
                          ),
                          color: barColor,
                        ),
                        width: 30,
                        height: values[6] * 140,
                      ),
                      Container(
                        child: Text(
                          keys[6].substring(0, 3),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 15,
                child:Container(
                  height: 2,
                  width: 330,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  alignment: Alignment.center,
                  height: 1,
                  width: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.amber.shade800,
                          Colors.amber.shade50
                        ]
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Text(
                  "$max SEK",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 12,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}