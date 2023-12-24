import 'package:restart_app/restart_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartspend/widgets/customtextfield.dart';
import 'package:smartspend/widgets/backbutton.dart';
import 'package:smartspend/backend/user.dart';
import 'package:smartspend/backend/wyrm/database.dart';


class UserInfo extends StatefulWidget{
  UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfo();

}

class _UserInfo extends State<UserInfo>{
  late User client;
  Wyrm database = Wyrm();
  bool _loading = true;

  @override
  void initState(){
    initArgs();
  }

  Future<void> initArgs() async {
    User tmp = (await database.users()).first;
    setState(() {
      client = tmp;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context){
    if(_loading){
      return const CircularProgressIndicator();
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color(0xFF1E2038),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 30, left: 20),
                      child: CustomizedBackButton()
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Align(
                      alignment: Alignment(-0.9, -0.8),
                      child: Text(
                        "User\nInformation",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w800
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 70,),
                  Container(
                    child: CardWidget(
                      client: client,
                    ),
                  ),
                ],
              ),
              Container(
                  alignment: Alignment(0,-0.23),
                  child: Profile(
                    name: client.name,
                  )
              ),
            ],
          ),
        ),
      )
    );
  }

}
class CardWidget extends StatefulWidget {
  final User client;


  CardWidget({super.key, required this.client});

  @override
  State<StatefulWidget> createState() => _CardWidget();
}

class _CardWidget extends State<CardWidget> {
  Wyrm database = Wyrm();
  final List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  bool changedArgs = false;
  bool _loading = true;

  @override
  void initState() {
    setState(() {
      _loading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(_loading) {
      return CircularProgressIndicator();
    }
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)
        ),
        child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: CustomTextField(
                      topText: "Name",
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.75,
                      controller: controllers[0],
                      keyboardType: TextInputType.text,
                      function: (){},
                      icon: Icon(Icons.person),
                      inBoxText: widget.client.name,
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: CustomTextField(
                        topText: "Birth-date",
                        height: 50,
                        readOnly: true,
                        width: MediaQuery.of(context).size.width * 0.8,
                        controller: controllers[1],
                        function: (){},
                        icon: Icon(Icons.date_range),
                        inBoxText: widget.client.birthDate,
                      )
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: CustomTextField(
                        topText: "Monthly Income",
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.8,
                        controller: controllers[2],
                        keyboardType: TextInputType.number,
                        function: (){},
                        icon: Icon(Icons.monetization_on_outlined),
                        inBoxText: widget.client.monthlyIncome.toString(),
                      )
                  ),
                  Visibility(
                    visible: changedArgs,
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "SUCESS!",
                        style: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        widget.client.name = controllers[0].text;
                        widget.client.monthlyIncome = double.parse(controllers[2].text);
                        await database.updateEntryInTable(
                            'user',
                            'userID',
                            widget.client.userID,
                            widget.client);
                        setState(() {
                          changedArgs = true;
                        });
                      },
                      child: const Text(
                        "Save",
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
        )
      ),
    );
  }
}

class Profile extends StatelessWidget {
  String name;

  Profile({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 55,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.deepOrangeAccent, //Orange circle on top of the white one
        child: Text(
          name.substring(0, 1).toUpperCase(),
          style: TextStyle(
            fontSize: 55,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}