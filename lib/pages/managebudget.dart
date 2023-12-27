import 'package:flutter/material.dart';
import 'package:smartspend/widgets/backbutton.dart';
import 'package:smartspend/widgets/editablebudgetcat.dart';
import 'package:smartspend/pages/addnewbudget.dart';
import 'package:smartspend/widgets/addcat.dart';
import 'package:smartspend/backend/category.dart';
import 'package:smartspend/backend/wyrm/database.dart';

class MainBudget extends StatefulWidget {
  const MainBudget({super.key});

  @override
  State<MainBudget> createState() => _MainBudgetState();
}

class _MainBudgetState extends State<MainBudget> {

  //calculate available budget in acc
  //double available = ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E2138),
      body: Stack(
        children: [
          const Positioned(
            top: 40,
            left: 20,
            child: CustomizedBackButton(),
          ),
          Positioned(
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
                    fontWeight: FontWeight.w800
                )),
                SizedBox(height: 70),
                Text('Total Available Budget', style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  color: Colors.white,
                )),
                Text("Available", style: TextStyle(          //should be the number of money available in the account
                    fontFamily: 'Montserrat',
                    fontSize: 30,
                    height: 1.2,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical:1),
                child: LV(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class LV extends StatefulWidget {
  const LV({super.key});

  @override
  _LV createState() => _LV();
}

class _LV extends State<LV> {
  late List<Category> categories;
  Wyrm database = Wyrm();
  bool load = false;

  Future<void> initArgs() async {
    categories = await database.categories();

    setState(() {
      load = true;
    });
  }

  @override
  void initState() {
    super.initState();
    initArgs();
  }

  @override
  Widget build(BuildContext context) {
    if (load == false) {
      return EditableBudgetCat(
        name: "No category founded", // Access the property of Category
        color: Colors.red,
        number: 0,
      );
    }
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 10)
        ),
        Expanded(
          child: ListView.separated(
            itemCount: categories.length,
            separatorBuilder: (context, index) =>
            const Divider(height: 20, color: Color(0xffF5F5F5)),
            itemBuilder: (BuildContext context, int index) {
              return EditableBudgetCat(
                name: categories[index].categoryName, // Access the property of Category
                color: Color(categories[index].categoryColor),
                number: categories[index].spendingLimit,
              );
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: AddCatButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddNewCat(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
