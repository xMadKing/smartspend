import 'package:flutter/material.dart';

class BarChart extends StatelessWidget{
  final double width;
  final Color barColor;
  final Map<String, num> dataMap;
  List<double> values = [];

  BarChart({super.key, required this.dataMap, required this.width, required this.barColor});

  num normalizeData(){
    print(dataMap);
    List<String> keys = dataMap.keys.toList();
    List<num> vals = dataMap.values.toList();
    vals.sort();
    num min = 0;
    num max = vals[vals.length-1];
    if(max.isNaN || max == 0){
      return 1;
    }
    for(int i = 0; i < keys.length; i++){
      values.add(((dataMap[keys[i]] !- min) / (max - min)));
    }
    return max;
  }

  List<Widget> graphBars(double wi, double hi){
    List<String> keys = dataMap.keys.toList();
    double factor = 1;
    List<Widget> bars = [];
    print(values);
    for(int i = 0; i < keys.length; i++){
      if(values.length == 0){
        values = [0,0,0,0,0,0,0];
      }
      bars.add(
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5)
                ),
                color: barColor,
              ),
              width: wi * 0.08,
              height: values[i] * (hi * 0.15),
            ),
            Container(
              child: Text(
                keys[i],
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        )
      );
    }
    return bars;
  }

  @override
  Widget build(BuildContext context) {
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
                children: graphBars(
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height,
                ),
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
                  style: const TextStyle(
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