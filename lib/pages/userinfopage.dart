import 'package:restart_app/restart_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartspend/widgets/customtextfield.dart';
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
    return(
      Scaffold(
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1E2038),
                ),
            ),
            Container(
                child: Align(
                  alignment: Alignment(-0.9, -0.8),
                  child: Text(
                    "User\nInformation",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
            Container(
              child: CardWidget(
                client: client,
              ),
            ),

            Align(child: Profile(
              name: client.name,
            )),
          ],
        )
      )
    );
  }

}


class CardWidget extends StatelessWidget {
  final List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
  ];
  final User client;
  Wyrm database = Wyrm();

  CardWidget({
    super.key,
    required this.client,
  });

  @override
  Widget build(BuildContext context) {
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
            height: MediaQuery.of(context).size.height * 0.5,
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
                    margin: EdgeInsets.only(top: 75),
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: CustomTextField(
                      topText: "Name",
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.75,
                      controller: controllers[0],
                      function: (){},
                      icon: Icon(Icons.person),
                      inBoxText: client.name,
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
                        inBoxText: client.birthDate,
                      )
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "THIS ACTION WILL RESTART THE APPLICATION!",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: "Montserrat",
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
                        client.name = controllers[0].text;
                        print(client.name);
                        database.updateEntryInTable(
                            'user',
                            'userID',
                            client.userID,
                            client);
                        Restart.restartApp();
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