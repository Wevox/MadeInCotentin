import 'package:flutter/material.dart';

import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class CountDownTimer extends StatefulWidget {
  DateTime endTimer;
  CountDownTimer({this.endTimer});
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  @override
  Widget build(BuildContext context) {
    int endTime = this.widget.endTimer.millisecondsSinceEpoch;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CountdownTimer(
            endTime: endTime,
            widgetBuilder: (_, CurrentRemainingTime time) {
              String text_fin;

              // S'il reste plus de 1 jour et 1 heure
              if (time.days != null) {
                text_fin = time.days.toString() +
                    " JOUR" +
                    (time.days > 1 ? "S" : "") +
                    " " +
                    (time.hours < 10 ? "0" : "") +
                    time.hours.toString() +
                    ":" +
                    (time.min < 10 ? "0" : "") +
                    time.min.toString() +
                    ":" +
					(time.sec < 10 ? "0" : "") +
					time.sec.toString();
              } else {
                // Il reste moins de 25 heures
                text_fin = (time.hours < 10 ? "0" : "") +
                    time.hours.toString() +
                    "H " +
                    (time.min < 10 ? "0" : "") +
                    time.min.toString() +
                    "min." +
                    (time.sec < 10 ? "0" : "") +
                    time.sec.toString() + " sec.";
              }

              return Text(text_fin, style: TextStyle(fontWeight: FontWeight.bold, color: ( (endTime - DateTime.now().millisecondsSinceEpoch) < 12*60*60*1000 ? Colors.orangeAccent :Colors.teal)),);
            },
          ),
        ],
      ),
    );
  }
}
