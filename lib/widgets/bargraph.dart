import 'package:flutter/material.dart';

class BarChart extends StatelessWidget{
  final double width;
  final Color barColor;
  final Map<String, num> dataMap;
  List<double> values = [];

  BarChart({super.key, required this.dataMap, required this.width, required this.barColor});

  num normalizeData(){
    List<String> keys = dataMap.keys.toList();
    List<num> vals = dataMap.values.toList();
    vals.sort();
    num min = 0;
    num max = vals[vals.length-1];
    for(int i = 0; i < keys.length; i++){
      values.add(((dataMap[keys[i]] !- min) / (max - min)));
    }
    return max;
  }

  @override
  Widget build(BuildContext context) {
    List<String> keys = dataMap.keys.toList();
    num max = normalizeData();
    return SizedBox(
      width: width * 0.95,
      height: MediaQuery.of(context).size.height * 0.175,
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
                        width: MediaQuery.of(context).size.width * 0.08,
                        height: values[0] * (MediaQuery.of(context).size.height * 0.15),
                      ),
                      Container(
                        child: Text(keys[0].substring(0, 3),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
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
                        width: MediaQuery.of(context).size.width * 0.08,
                        height: values[1] * (MediaQuery.of(context).size.height * 0.15),
                      ),
                      Container(
                        child: Text(keys[1].substring(0, 3),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
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
                        width: MediaQuery.of(context).size.width * 0.08,
                        height: values[2] * (MediaQuery.of(context).size.height * 0.15),
                      ),
                      Container(
                        child: Text(keys[2].substring(0, 3),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
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
                        width: MediaQuery.of(context).size.width * 0.08,
                        height: values[3] * (MediaQuery.of(context).size.height * 0.15),
                      ),
                      Container(
                        child: Text(keys[3].substring(0, 3),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
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
                        width: MediaQuery.of(context).size.width * 0.08,
                        height: values[4] * (MediaQuery.of(context).size.height * 0.15),
                      ),
                      Container(
                        child: Text(keys[4].substring(0, 3),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
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
                        width: MediaQuery.of(context).size.width * 0.08,
                        height: values[5] * (MediaQuery.of(context).size.height * 0.15),
                      ),
                      Container(
                        child: Text(
                          keys[5].substring(0, 3),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
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
                        width: MediaQuery.of(context).size.width * 0.08,
                        height: values[6] * (MediaQuery.of(context).size.height * 0.15),
                      ),
                      Container(
                        child: Text(
                          keys[6].substring(0, 3),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
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
                  width: MediaQuery.of(context).size.width * 0.75,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  alignment: Alignment.center,
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.7,
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
                    fontWeight: FontWeight.w700
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