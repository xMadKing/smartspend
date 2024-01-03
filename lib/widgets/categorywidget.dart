import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';


class CategoryWidget extends StatefulWidget{
  final String name;
  final Color color;
  final double number;
  final double limit;
  bool notificationSent = false;

  CategoryWidget({
    super.key,
    required this.name,
    required this.color,
    required this.number,
    required this.limit
  });

  @override
  State<StatefulWidget> createState() => _CategoryWidget();

}

class _CategoryWidget extends State<CategoryWidget>{
  static late Color bgColor;
  static late Color fontColor;
  static bool _loading = true;


  Future<void> sendNotification() async {
    if (widget.number > widget.limit && !widget.notificationSent){
      widget.notificationSent = true;
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 1,
          channelKey: 'smartspend_notification_channel',
          actionType: ActionType.Default,
          title: 'SmartSpend: Limit Exceeded!',
          body: 'Limit on ${widget.name} has been exceeded! Current Spending ${widget.number}.'
        ),
        schedule: NotificationInterval(interval: 5, repeats: false),
      );
    }
  }

  Future<void> initArgs() async {
    await sendNotification();
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    initArgs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(_loading) {
      return LinearProgressIndicator();
    }
    if (widget.number > widget.limit){
      bgColor = Colors.red.shade400;
      fontColor = Colors.white;
    } else {
      bgColor = Colors.white;
      fontColor = Colors.black;
    }
    return GestureDetector(
      onTap: () {
        //we can maybe add future functionality here
      },
      child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: bgColor,
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
                margin: const EdgeInsets.all(10),
                child: Icon(
                  Icons.circle_rounded,
                  color: widget.color,
                  size: 32,
                )
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.name,
                  style: TextStyle(
                    color: fontColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                  },
                  child: Text(
                    "${widget.number}",
                    style: TextStyle(
                      color: fontColor,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }

}