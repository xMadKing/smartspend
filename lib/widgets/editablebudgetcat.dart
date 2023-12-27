import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:smartspend/backend/wyrm/database.dart';

class EditableBudgetCat extends StatefulWidget{
  final String name;
  final Color color;
  final num number;
  final int categoryID;

  const EditableBudgetCat({super.key,
    required this.name,
    required this.color,
    required this.number,
    required this.categoryID});

  @override
  State<EditableBudgetCat> createState() => _EditableBudgetCat();
}

class _EditableBudgetCat extends State<EditableBudgetCat> {
  bool deleted = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 14;
    double width = MediaQuery.of(context).size.width /1.2;

    if(deleted){
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        child: Center(
          child: Text(
              "DELETED",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      );
    }

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
                              onTap: () async {
                                Wyrm database = Wyrm();
                                await database.deleteFromTable(
                                    "categoryID",
                                    'category',
                                    widget.categoryID
                                );
                                await database.deleteFromTable(
                                    'categoryID',
                                    'payment',
                                    widget.categoryID);
                                setState(() {
                                  deleted = true;
                                });
                              },
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