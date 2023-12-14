import 'package:flutter/material.dart';
import 'package:smartspend/widgets/bargraph.dart';

class GraphCard extends StatefulWidget {
  final String cardName;
  final Color barColor;
  final Map<String, num> dataMap;

  const GraphCard({super.key, required this.cardName, required this.barColor,
    required this.dataMap});

  @override
  State<GraphCard> createState() => _GraphCard();
}

class _GraphCard extends State<GraphCard>{

  double _getSum(){
    double sum = 0;
    for (var element in widget.dataMap.values) {sum += element;}
    return sum;
  }


  @override
  Widget build(BuildContext context) {
    double sum = _getSum();
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  widget.cardName,
                  style: const TextStyle(
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
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  "$sum",
                  style: const TextStyle(
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
                  width: MediaQuery.of(context).size.width * 0.8,
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

