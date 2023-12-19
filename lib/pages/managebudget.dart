import 'package:flutter/material.dart';
import 'package:smartspend/widgets/backbutton.dart';
import 'package:smartspend/widgets/editablebudgetcat.dart';
import 'package:smartspend/pages/addnewbudget.dart';
import 'package:smartspend/widgets/addcat.dart';


class MainBudget extends StatefulWidget {
  const MainBudget({super.key});

  @override
  State<MainBudget> createState() => _MainBudgetState();
}

class _MainBudgetState extends State<MainBudget> {
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
                  fontWeight: FontWeight.w800
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



class LV extends StatelessWidget {
  const LV({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children : [
          Expanded(
              child: ListView.separated(
                itemCount: 2,
                separatorBuilder: (context, index) => const Divider(height: 20, color: Color(0xffF5F5F5)),
                itemBuilder: (BuildContext context, int index) {
                  return EditableBudgetCat(name: 'Food',
                      color: Colors.deepOrange,
                      number: 4500);
                },
              )
          ),
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child:AddCatButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => AddNewCat())
                    );
                  },
              )
          )
        ]
    );
  }
}