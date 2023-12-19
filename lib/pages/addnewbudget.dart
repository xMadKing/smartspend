import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartspend/widgets/backbutton.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:smartspend/widgets/savenewcat.dart';
import 'package:smartspend/pages/managebudget.dart';

class AddNewCat extends StatefulWidget {
  @override
  const AddNewCat({Key? key}) : super(key: key);

  @override
  State<AddNewCat> createState() => _AddNewCat();
}

class _AddNewCat extends State<AddNewCat> {
  FocusNode _textFieldFocusNode = FocusNode();
  TextEditingController _catNameController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  bool _isKeyboardAppear = false;

  @override
  void initState() {
  super.initState();
  _catNameController = TextEditingController();
}

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    _catNameController.dispose();
    super.dispose();
  }

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
                    fontWeight: FontWeight.w600
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
                    fontWeight: FontWeight.w600
                  )),
                ],
              ),
            ),
            AnimatedPositioned(
                //top: 340,
                duration: Duration(milliseconds: 300),
                bottom: _isKeyboardAppear ? 0 : 0,
                left: 0,
                right: 0,
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
                                  fontWeight: FontWeight.w800,
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
                              child: TextField(
                                controller: _catNameController, // receive text input 
                                style: TextStyle(
                                    fontFamily: 'Montserrat', 
                                    fontWeight: FontWeight.w600,  
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Category Name',
                                    hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0xFFBABABA)
                                    ),
                                    //labelText: widget.label,
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0)
                                  ),
                              )
                          ),
                          Container(
                            padding: const EdgeInsets.only(top:20),
                          ),
                          Row(
                              children: [
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start, 
                                    children : [
                                      Container(
                                          margin: const EdgeInsets.only(left:30),
                                          child: const Text(
                                            'Amount',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
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
                                          child: TextField(
                                              controller: _amountController,
                                              focusNode: _textFieldFocusNode,
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,  
                                              ),
                                              decoration: InputDecoration(
                                                hintText: 'SEK',
                                                hintStyle: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Color(0xFFBABABA)
                                                ),
                                                //labelText: widget.label,
                                                border: InputBorder.none,
                                                contentPadding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0)
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  _isKeyboardAppear = true;
                                                });
                                              },
                                          )
                                      )
                                    ]
                                ),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start, 
                                    children : [
                                      Container(
                                          margin: const EdgeInsets.only(left:20),
                                          child: const Text(
                                            'Color',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff2F2F2F)
                                            ),
                                          )
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(top:5),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left:20),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
                                          ),
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
                                        fontWeight: FontWeight.w600,
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
                                    child: TextField(
                                        controller: _descController,
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                        ),
                                        decoration: InputDecoration(
                                          //labelText: widget.label,
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0)
                                        )
                                    )
                                )
                              ]
                          ),
                        Container(
                          padding: const EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          child: NewCatButton(
                            onPressed: () {
                              // Handle button press
                              // The text here is to be added to the database
                              print(_catNameController.text);
                              print(_amountController.text);
                              print(_descController.text);
                              // Navigate to Manage Budget page
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                builder: (context) => MainBudget())
                              );
                      },
                    ),
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
                /// The hexcode here is to be added to the database
                String hexCode = chosen.value.toRadixString(16).substring(2);
                print(hexCode);
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

