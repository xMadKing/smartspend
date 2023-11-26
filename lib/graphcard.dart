import 'package:flutter/material.dart';
import 'package:smartspend/bargraph.dart';

class GraphCard extends StatefulWidget {
  final String cardName;
  final Color barColor;
  final Map<String, double> dataMap;

  const GraphCard({super.key, required this.cardName, required this.barColor,
    required this.dataMap});

  @override
  State<GraphCard> createState() => _GraphCard();
}

class _GraphCard extends State<GraphCard>{

  double _getSum(){
    double sum = 0;
    widget.dataMap.values.forEach((element) {sum += element;});
    return sum;
  }


  @override
  Widget build(BuildContext context) {
    double sum = _getSum();
    return Container(
      width: 380,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  widget.cardName,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "$sum",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                    fontSize: 34,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  "2024-01-01",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontFamily: "Montserrat",
                    fontSize: 12,
                    fontStyle: FontStyle.italic
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: BarChart(
                  barColor: widget.barColor,
                  width: 330,
                  dataMap: widget.dataMap,
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}

