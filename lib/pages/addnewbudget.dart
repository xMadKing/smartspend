import 'package:flutter/material.dart';
import 'package:smartspend/widgets/backbutton.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';



class AddNewCat extends StatefulWidget {
  @override
  const AddNewCat({Key? key}) : super(key: key);

  @override
  State<AddNewCat> createState() => _AddNewCat();
}

class _AddNewCat extends State<AddNewCat> {

  @override
  Widget build(BuildContext context) {
    double desiredWidth = MediaQuery.of(context).size.width /1.2;
    double desiredHeight = MediaQuery.of(context).size.height /15;

    return Scaffold(
      backgroundColor: const Color(0xff1E2138),
      body: Stack(
          children: [
            const Positioned(
              top: 40,
              left: 20,
              child: CustomizedBackButton(),
            ),
            const Positioned(
              top: 100,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Manage\nBudget", style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 50,
                    height: 1,
                    color: Colors.white,
                  )),
                  SizedBox(height: 70),
                  Text('Total Available Budget', style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    color: Colors.white,
                  )),
                  Text('FROM USER DATA', style: TextStyle(          //should be the number of money available in the account
                    fontFamily: 'Montserrat',
                    fontSize: 30,
                    height: 1.2,
                    color: Colors.white,
                  )),
                ],
              ),
            ),
            Positioned(
                top: 340,
                child: Container(
                    height: MediaQuery.of(context).size.height - 340,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top:20),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left:35),
                            child: const Text(
                              'Category Name',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  color: Color(0xff2F2F2F)
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top:5),
                          ),
                          Container(
                              margin: const EdgeInsets.only(left:30),
                              width: desiredWidth,
                              height: desiredHeight,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const TextField(
                                  decoration: InputDecoration(
                                    hintText: '  Food',
                                    //labelText: widget.label,
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                  )
                              )
                          ),
                          Container(
                            padding: const EdgeInsets.only(top:20),
                          ),
                          Row(
                              children: [
                                Column(
                                    children : [
                                      Container(
                                          margin: const EdgeInsets.only(left:35),
                                          child: const Text(
                                            'Amount',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 14,
                                                color: Color(0xff2F2F2F)
                                            ),
                                          )
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(top:5),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.only(left:30),
                                          width: 4*desiredWidth/6,
                                          height: desiredHeight,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15.0),
                                          ),
                                          child: const TextField(
                                              decoration: InputDecoration(
                                                hintText: '  SEK',
                                                //labelText: widget.label,
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.zero,
                                              )
                                          )
                                      )
                                    ]
                                ),
                                Column(
                                    children : [
                                      Container(
                                          margin: const EdgeInsets.only(left:30),
                                          child: const Text(
                                            'Color',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 14,
                                                color: Color(0xff2F2F2F)
                                            ),
                                          )
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(top:5),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left:20),
                                          color: Colors.white,
                                          width: 1.5*desiredWidth/6,
                                          height: desiredHeight,
                                          child: Row(
                                              children: [
                                                Container(
                                                    margin: const EdgeInsets.only(left:15),
                                                    width: desiredHeight/2,
                                                    height: desiredHeight/2,
                                                    child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(desiredHeight/2),
                                                        child: ColorSelect()
                                                    )
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(left: 10),
                                                ),
                                                const Icon(Icons.arrow_drop_down_outlined, color: Color(0xFF2F2F2F))
                                              ]
                                          )
                                      )
                                    ]
                                ),
                              ]
                          ),
                          Container(
                            padding: const EdgeInsets.only(top:20),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children : [
                                Container(
                                    margin: const EdgeInsets.only(left:35),
                                    child: const Text(
                                      'Description',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 14,
                                          color: Color(0xff2F2F2F)
                                      ),
                                    )
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top:5),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(left:30),
                                    width: desiredWidth,
                                    height: desiredHeight*2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: const TextField(
                                        decoration: InputDecoration(
                                          //labelText: widget.label,
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.zero,
                                        )
                                    )
                                )
                              ]
                          ),
                        ]
                    )
                )
            ),
          ]
      ),
    );
  }
}




//class for color picker
class ColorSelect extends StatefulWidget{

  ColorSelect({super.key});

  @override
  State<StatefulWidget> createState() => _ColorSelect();
}

class _ColorSelect extends State<ColorSelect>{
  Color chosen = Color(0xff3B9A2C);

  void ColorPickerpop(){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: BlockPicker(
              pickerColor: chosen,
              onColorChanged: (color) {
                setState(() {
                  chosen = color;
                });
              },
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ColorPickerpop,
        child: Container(
          width: 50,
          height: 50,
          color: chosen,
        )
    );
  }
}