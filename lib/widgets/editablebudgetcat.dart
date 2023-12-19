import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class EditableBudgetCat extends StatefulWidget{
  final String name;
  final Color color;
  final double number;

  const EditableBudgetCat({super.key, required this.name, required this.color, required this.number});

  @override
  State<EditableBudgetCat> createState() => _EditableBudgetCat();
}

class _EditableBudgetCat extends State<EditableBudgetCat> {
  //should access the database and instead of the list

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 14;
    double width = MediaQuery.of(context).size.width /1.2;

    return Stack(
      //crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.center,
        clipBehavior: Clip.antiAlias,
        children: [
          Positioned.fill(
            child: Builder(
              builder: (BuildContext context) => Padding(
                  padding: const EdgeInsets.fromLTRB(100, 0, 100,0),
                  child: Container(color: Colors.white)
              ),
            ),
          ),
          Slidable(
              endActionPane: ActionPane(
                motion: const BehindMotion(),
                extentRatio: 0.35,
                children: [
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                              onTap: () {},
                              child: Container(
                                  alignment: Alignment.center,
                                  width: 60,
                                  height: height,
                                  decoration: const BoxDecoration(
                                    color:Colors.white,
                                    //borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  child: const Icon(
                                    Icons.edit_document,
                                    color: Color(0xffBABABA),
                                  )
                              )
                          )
                      )
                  ),
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                              onTap: () {},
                              child: Container(
                                  alignment: Alignment.center,
                                  width: 120,
                                  height: height,
                                  decoration: const BoxDecoration(
                                    color:Color(0xffE76201),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: const Text(
                                    "Delete",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16
                                    ),
                                  )
                              )
                          )
                      )
                  )
                ],
              ),
              child:Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left:10.0),
                          child: Icon(
                            Icons.circle,
                            color: widget.color,
                            size: 25,
                          )
                      ),
                      Container(
                          margin: const EdgeInsets.only(left:50.0),
                          child: Text(
                            widget.name,
                            style: const TextStyle(fontSize:16.0, fontFamily: 'Montserrat', color: Color(0xff2F2F2F), fontWeight: FontWeight.w600),
                          )
                      ),
                      Container(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    widget.number.toString(),
                                    style: const TextStyle(fontSize:16.0, fontFamily: 'Montserrat', color: Color(0xff2F2F2F),fontWeight: FontWeight.w600),
                                  )
                              )
                          )
                      )
                    ],
                  )
              )
          )
        ]
    );
  }
}