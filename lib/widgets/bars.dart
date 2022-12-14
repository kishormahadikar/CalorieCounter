import 'package:flutter/material.dart';

class Bars extends StatelessWidget {
  String day;
  int calories;
  double calTarget;

  Bars({this.calTarget, this.calories, this.day});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Text(day),
          SizedBox(
            height: 7,
          ),
          Container(
            height: 50,
            width: 10,
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              FractionallySizedBox(
              heightFactor: calTarget,
              child: Container(
                decoration: BoxDecoration(color: Colors.red ,
                borderRadius: BorderRadius.circular(10)
              )
            ))
            ]),
          ),
          SizedBox(
            height: 7,
          ),
          FittedBox(
            fit: BoxFit.contain,
            child:Text(calories.toString())),
          SizedBox(
            height: 7,
          ),
        ],
      ),
    );
  }
}
