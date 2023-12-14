import 'package:flutter/material.dart';

class ProgressBarWidget extends StatefulWidget {
  final Color barColor;
  final Color barFillColor;
  final Color bgColor;
  final double width;
  final String text;

  const ProgressBarWidget({super.key,
    required this.barColor,
    required this.barFillColor,
    required this.bgColor,
    required this.width,
    required this.text,
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
      width: MediaQuery.of(context).size.width * 0.9,
      height: 80,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 80,
              child: Stack(
                children: [
                  Positioned(
                    left: (MediaQuery.of(context).size.width * 0.9)-100,
                    top: 40,
                    child: Container(width: 2),
                  ),
                  Positioned(
                    left: 20,
                    top: 15,
                    child: SizedBox(
                      height: 15,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.text,
                            style: const TextStyle(
                              color: Color(0xFF1E2038),
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
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
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: widget.barColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    width: (MediaQuery.of(context).size.width * 0.8),
                    height: 20,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: widget.barFillColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  width: widget.width * (MediaQuery.of(context).size.width * 0.8),
                  height: 20,
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}