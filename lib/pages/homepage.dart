
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartspend/backend/category.dart';
import 'package:smartspend/widgets/progress_bar.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:smartspend/widgets/categorywidget.dart';
import 'package:smartspend/pages/monthlybudgetpage.dart';
import 'package:smartspend/backend/user.dart';
import 'package:smartspend/backend/wyrm/database.dart';
import 'package:smartspend/pages/myaccountpage.dart';

class HomePage extends StatefulWidget {
  final User client;

  const HomePage({super.key, required this.client});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  late List<Category> categories;
  Map<String, double> dataMap = {};
  bool _loading = true;
  Wyrm database = Wyrm();

  @override
  void initState() {
    super.initState();
    initArgs();
  }

  Future<void> initArgs() async {
    categories = await database.categories();
    setState(() {
      _loading = false;
    });
  }

  double getTotalSpending() {
    double res = 0;
    for (var element in categories) {
      res += element.currentSpending.toDouble();
    }
    return res;
  }

  List<Widget> categoryWidgets() {
    List<Widget> res = [];
    for (var element in categories) {
      res.add(CategoryWidget(
        name: element.categoryName,
        color: Color(element.categoryColor),
        bgColor: Colors.white,
        number: element.currentSpending.toDouble(),
        limit: element.spendingLimit.toDouble(),
      ));
    }
    return res;
  }

  List<Color> getColors(){
    List<Color> res = [];
    categories.forEach((element) {
      res.add(Color(element.categoryColor));
    });
    return res;
  }

  @override
  Widget build(BuildContext context) {
    if(_loading){
      return const CircularProgressIndicator();
    }
    for (var element in categories) {
      dataMap.addEntries([MapEntry(element.categoryName, element.currentSpending.toDouble())]);
    }
    double width = getTotalSpending() / widget.client.monthlyIncome;
    Color barColor = Colors.purple.shade800;
    if(width >= 0.8){
      barColor = Colors.red.shade700;
      if(width > 1) {
        width = 1;
      }
    }
    String name = widget.client.name;
    return PopScope(
      canPop: false,
        child: Scaffold(
          body: Stack (
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF1E2038),
                ),
              ),
              Center(
                  child: GestureDetector(
                    onDoubleTap: () async {
                      List<Category> categories = await database.categories();
                      for (var category in categories) {
                        await category.loadSpending();
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MonthlyBudgetPage(
                            categories: categories,
                          )));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Align(
                        alignment: const Alignment(0, -0.2),
                        child: ProgressBarWidget(
                          width: width,
                          bgColor: const Color(0xFFF5F5F5),
                          barColor: Colors.purple.shade300,
                          barFillColor: barColor,
                          text: "Monthly Budget",
                        ),
                      ),
                    ),
                  )
              ),
              const Align(
                alignment: Alignment(-0.9, -0.8),
                child: Text(
                  "Home",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
              const Align(
                alignment:  Alignment(-.9, -0.65),
                child: Text(
                  "Hello,",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                  ),
                ),
              ),
              Align(
                alignment:  const Alignment(-.9, -0.55),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                  ),
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.47,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                List<Category> categories = await database.categories();
                                for (var category in categories) {
                                  await category.loadSpending();
                                }
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)
                                    => MonthlyBudgetPage(
                                      categories: categories,
                                    )));
                              },
                              child: Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: 380,
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 20),
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          "Spending by Category",
                                          style: TextStyle(
                                            color: Color(0xFF1E2038),
                                            fontSize: 16,
                                            fontFamily: 'Montserrat',
                                          ),
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.only(right: 10),
                                          alignment: Alignment.centerRight,
                                          child: IconButton(
                                              onPressed: () async {
                                                List<Category> categories = await database.categories();
                                                for (var category in categories) {
                                                  await category.loadSpending();
                                                }
                                                Navigator.push(context,
                                                    MaterialPageRoute(builder:
                                                        (context) => MonthlyBudgetPage(
                                                          categories: categories,
                                                        )));
                                              },
                                              icon: const Icon(
                                                Icons.keyboard_arrow_right,
                                                size: 25,
                                              )
                                          )
                                      ),
                                    ],
                                  )
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(20),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: PieChart(
                                  centerWidget: Text(
                                    getTotalSpending().toString(),
                                    style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  dataMap: dataMap,
                                  animationDuration: const Duration(milliseconds: 500),
                                  chartType: ChartType.ring,
                                  chartRadius: 170,
                                  ringStrokeWidth: 40,
                                  chartValuesOptions: const ChartValuesOptions(
                                    showChartValues: false,
                                  ),
                                  legendOptions: const LegendOptions(
                                    showLegends: false,
                                  ),
                                  colorList: getColors()
                                  ,
                                ),
                              ),
                            ),
                            Column(
                              children: categoryWidgets(),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}