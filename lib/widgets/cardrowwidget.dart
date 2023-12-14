import 'package:flutter/material.dart';

class CardRowWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color icon_color;
  final bool slider;
  final Widget Function()? link;
  CardRowWidget({required this.name, required this.icon, this.icon_color = Colors.black,
                this.link = null, this.slider = false});

  @override
  Widget build(BuildContext context) {

    return Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        width: MediaQuery.of(context).size.width * 0.86,
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all(10),
              child: Icon(
                icon,
                color: icon_color,
                size: 32,
              )
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                name,
                style: TextStyle(
                  color: Color(0xFF1E2038),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),

            if(!slider) MyArrow(),
            if(slider) SwitchButton(),
            const Spacer(),
          ],
        )
    );
  }

}


class MyArrow extends StatelessWidget {
  const MyArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10),
        alignment: Alignment(4, 0),
        child: Icon(
          Icons.keyboard_arrow_right,
          size: 25,
        )
    );
  }
}


class SwitchButton extends StatefulWidget {

  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {

    bool notif = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 100),
      alignment: Alignment(4, 0),
      child: SizedBox(
        child: Switch(
          value: notif,
          activeColor: Colors.orange[800],
          onChanged: (bool value){
            print("state changed!");
        
            setState(() {
              notif = value;
            });
          },
        ),
      )
    );
  }
}