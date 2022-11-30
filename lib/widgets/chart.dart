import 'package:calorie/models/model1.dart';
import 'package:calorie/widgets/bars.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  @override
  final List<Calorie> foodHere;
  int targetCal;
  Chart({this.foodHere,this.targetCal});

  List<Map<String, Object>> get calorieCountPerDay {
    return List.generate(7, (index) {
      int tCalories = 0;
      final weekDay = DateTime.now().subtract(Duration(days: index));
      for (int i = 0; i < foodHere.length; i++) {
        if (weekDay.day == foodHere[i].date.day &&
            weekDay.month == foodHere[i].date.month &&
            weekDay.year == foodHere[i].date.year) {
          tCalories += foodHere[i].calories;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'calories': tCalories};
    }).reversed.toList();
  }

  Widget build(BuildContext context) {
    //print(calorieCountPerDay)
    return Container(
      child: Card(
        child: Container(
          child: Row(
              children: calorieCountPerDay.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: Container(
                // height: 120,
                // width: 10,
                child: Bars(calTarget: ((e['calories'] as int) > targetCal) ? 1 : (e['calories'] as int) /targetCal ,day: e['day'],calories: e['calories'],)));
          }).toList()),
        ),
      ),
    );
  }
}
//inferior thyroid artery is branch of thyro cirvical trunk
