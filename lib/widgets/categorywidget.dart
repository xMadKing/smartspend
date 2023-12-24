import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String name;
  final Color color;
  final double number;
  final Color bgColor;
  final double limit;

  const CategoryWidget({super.key, required this.name, required this.color, required this.number,
    required this.bgColor, required this.limit});

  Color getFontColor(){
    if (number > limit){
      return Colors.red;
    }
    return const Color(0xFF1E2038);
  }

  @override
  Widget build(BuildContext context) {
    Color fontColor = getFontColor();
    return GestureDetector(
      onTap: () {
        //we can maybe add future functionality here
      },
      child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
          ),
          width: MediaQuery.of(context).size.width * 0.86,
          height: MediaQuery.of(context).size.height * 0.08,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.all(10),
                child: Icon(
                  Icons.circle_rounded,
                  color: color,
                  size: 32,
                )
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF1E2038),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {

                  },
                  child: Text(
                    "$number",
                    style: TextStyle(
                      color: fontColor,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }

}