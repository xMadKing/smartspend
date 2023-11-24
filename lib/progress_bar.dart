import 'package:flutter/material.dart';
import 'package:smartspend/main.dart';


class ProgressBarWidget extends StatefulWidget {
  final Color barColor;
  final Color barFillColor;
  final Color bgColor;
  final double width;

  const ProgressBarWidget({super.key,
    required this.barColor,
    required this.barFillColor,
    required this.bgColor,
    required this.width,
  });

  @override
  State<ProgressBarWidget> createState() => _ProgressBarWidget();
}

class _ProgressBarWidget extends State<ProgressBarWidget>{

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(20)
      ),
      width: 300,
      height: 80,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 316,
              height: 82,
              child: Stack(
                children: [
                  Positioned(
                    left: 283,
                    top: 41,
                    child: Container(width: 2),
                  ),
                  Positioned(
                    left: 19,
                    top: 12,
                    child: Container(
                      width: 100,
                      height: 15,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Monthly Budget',
                            style: TextStyle(
                              color: Color(0xFF1E2038),
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 40,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: widget.barColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  width: 260,
                  height: 18,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: widget.barFillColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  width: widget.width,
                  height: 18,
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}