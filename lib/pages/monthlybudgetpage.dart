import 'package:flutter/material.dart';
import 'package:smartspend/widgets/graphcard.dart';
import 'package:smartspend/widgets/trajectorywidget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:smartspend/backend/user.dart';
import 'package:smartspend/backend/category.dart';
import 'package:smartspend/backend/wyrm/database.dart';

class MonthlyBudgetPage extends StatefulWidget {
  MonthlyBudgetPage({super.key});

  @override
  State<MonthlyBudgetPage> createState() => _MonthlyBudgetPage();
}

class _MonthlyBudgetPage extends State<MonthlyBudgetPage>{
  late final List<Category> categories;
  late final List<Map<String, num>> data;
  late final User client;
  late final List<FlSpot> monthlyData;
  Wyrm database = Wyrm();
  bool _loading = true;

  Future<List<Map<String, num>>> initGraphs() async {
    List<Map<String, num>> maps = [];
    for(int i = 0; i < categories.length; i++){
      Map<String, num> map = await categories[i].getWeekSpending();
      maps.add(map);
    }
    return maps;
  }

  Future<void> initArgs() async {
    categories = await database.categories();
    client = (await database.users()).first;
    data = await initGraphs();
    monthlyData = await client.getTrajectory();

    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initArgs();
  }

  List<Widget> graphs() {
    List<Widget> res = [];
    for (int i = 0; i < categories.length; i++){
      res.add(
        Container(
          margin: const EdgeInsets.all(10),
          child: GraphCard(
            cardName: categories[i].categoryName,
            barColor: Color(categories[i].categoryColor),
            dataMap: data[i],
          )
        )
      );
    }
    return res;
  }

  @override
  Widget build(BuildContext context){
    if (_loading) {
      return const CircularProgressIndicator();
    }
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50, left: 20),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      alignment: Alignment.topCenter,
                      child: const Text(
                        "Monthly Budget",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 32,
                            fontFamily: 'Montserrat',
                            color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TrajectoryData(
                      data: monthlyData,
                      client: client,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: graphs(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}