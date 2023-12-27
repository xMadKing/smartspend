import 'package:flutter/material.dart';
import 'package:smartspend/widgets/customtextfield.dart';
import 'package:smartspend/backend/wyrm/database.dart';
import 'package:smartspend/backend/category.dart';


class AddExpensePage extends StatefulWidget {
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  AddExpensePage({super.key});

  @override
  _AddExpensePageState createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  late List<Category> categories;
  late Category selectedCategory;
  DateTime dateSelected = DateTime.now();
  Wyrm database = Wyrm();
  bool _loading = true;
  bool expenseAdded = false;
  bool selectingCategory = false;

  @override
  void initState(){
    super.initState();
    initArgs();
  }

  bool isActivated() {
    if (widget.controllers[0].text.isNotEmpty
        && widget.controllers[1].text.isNotEmpty) {
      return true;
    }
    return false;
  }

  List<Widget> getCategories(){
    List<Widget> res = [];
    categories.forEach((element) {
      res.add(
        GestureDetector(
          onTap: () {
            setState(() {
              selectedCategory = element;
              selectingCategory = false;
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 40,
            margin: EdgeInsets.all(2.5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SizedBox(width: 10),
                Icon(
                  Icons.circle,
                  color: Color(element.categoryColor),
                ),
                SizedBox(width: 10),
                Text(
                  element.categoryName,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16
                  ),
                )
              ],
            ),
          ),
        )
      );
    });

    return res;
  }

  Future<void> initArgs() async {
    categories = await database.categories();
    selectedCategory = categories.first; //just a default
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_loading){
      return const CircularProgressIndicator();
    }
    Color buttonColor = Colors.grey;
    if (isActivated()){
      buttonColor = Colors.deepOrangeAccent;
    }
    return PopScope(
      canPop: false,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF1E2038),
                      Color.fromARGB(255, 26, 26, 42),
                    ],
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 40),
                    child: Text(
                      "Add\nExpense",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60)
                        ),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                SizedBox(height: 40),
                                CustomTextField(
                                  topText: "Amount",
                                  icon: Icon(Icons.monetization_on_outlined),
                                  controller: widget.controllers[0],
                                  inBoxText: "SEK",
                                  readOnly: false,
                                  keyboardType: TextInputType.number,
                                  function: () {},
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  height: MediaQuery.of(context).size.height * 0.06,
                                ),
                                SizedBox(height: 20),
                                CustomTextField(
                                  topText: "Category",
                                  controller: widget.controllers[3],
                                  inBoxText: selectedCategory.categoryName,
                                  icon: Icon(
                                    Icons.circle,
                                    color: Color(selectedCategory.categoryColor),
                                  ),
                                  readOnly: true,
                                  function: (){
                                    setState(() {
                                      selectingCategory = true;
                                    });
                                  },
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  height: MediaQuery.of(context).size.height * 0.06,
                                ),
                                SizedBox(height: 20),
                                CustomTextField(
                                    topText: "Date",
                                    icon: Icon(Icons.date_range),
                                    controller: widget.controllers[1],
                                    inBoxText: "Transaction date",
                                    readOnly: true,
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.height * 0.06,
                                    keyboardType: TextInputType.datetime,
                                    function: () async {
                                      DateTime? date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now(),
                                      );
                                      setState(() {
                                        widget.controllers[1].text =
                                        "${date?.year}-${date?.month}-${date?.day}";
                                        dateSelected = date!;
                                      });
                                    }
                                ),
                                SizedBox(height: 20),
                                CustomTextField(
                                  topText: "Description",
                                  controller: widget.controllers[2],
                                  inBoxText: "Expense description",
                                  icon: Icon(Icons.description),
                                  function: (){
                                    setState(() {
                                      widget.controllers[0] = widget.controllers[0];
                                    });
                                  },
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  height: MediaQuery.of(context).size.height * 0.12,
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: buttonColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextButton(
                                    onPressed: !isActivated() ? null : () {
                                      selectedCategory.addExpense(
                                        widget.controllers[1].text,
                                        int.parse(widget.controllers[0].text),
                                      );
                                      setState(() {
                                        expenseAdded = true;
                                      });
                                    },
                                    child: const Text(
                                      "Add Expense",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Montserrat",
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Visibility(
                              visible: expenseAdded,
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    widget.controllers.forEach((element) {
                                      element.text = "";
                                    });
                                    expenseAdded = false;
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.81,
                                  height: MediaQuery.of(context).size.height * 0.6,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.check_circle_rounded,
                                          color: Colors.green,
                                          size: 60,
                                        ),
                                        Text(
                                          "Yay!\nExpense added.",
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Visibility (
                              visible: selectingCategory,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 10,
                                        color: Color.fromRGBO(0, 0, 0, 0.5),
                                      ),
                                    ]
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Visibility (
                                visible: selectingCategory,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width * 0.81,
                                  height: categories.length * 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade300,
                                  ),
                                  child: Column(
                                    children: getCategories(),
                                  ),
                                )
                            ),
                          ),
                        ],
                      )
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}