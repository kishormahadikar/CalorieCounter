import 'package:flutter/material.dart';
import './widgets/chart.dart';
import './models/model1.dart';
import './widgets/addMeal.dart';
import './widgets/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalorieCounter',
      home: MyAppState(),
      theme: ThemeData.dark(),
    );
  }
}

class MyAppState extends StatefulWidget {
  @override
  State<MyAppState> createState() => _MyAppStateState();
}

class _MyAppStateState extends State<MyAppState> {
  @override
  List<Calorie> foodHere = [
    Calorie(
        date: DateTime.now(),
        calories: 500,
        id: DateTime.now().toString(),
        title: 'Food'),
  ];

  void removeMeal(String id) {
    setState(() {
      foodHere.removeWhere((element) => element.id == id);
    });
  }

  List<Calorie> get _recentTx {
    return foodHere
        .where((element) =>
            element.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  addDets(String title, int cals, DateTime selectedDate) {
    setState(() {
      foodHere.add(Calorie(
          title: title,
          calories: cals,
          date: selectedDate,
          id: DateTime.now().toString()));
    });
  }

  void sheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (index) {
          return AddItem(addDets: addDets);
        });
  }

  void SubmitCal() {
    var ttCal = int.parse(tCal.text);
    setState(() {
      targetCal = ttCal;
      Navigator.of(context).pop();
    });
  }

  var targetCal = 2500;
  final tCal = TextEditingController();
  void calSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (index) {
          return Column(
            children: [
              TextField(
                controller: tCal,
                onSubmitted: (_) {
                  SubmitCal();
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text(
                    'Enter your target cal',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Present goal is $targetCal'),
              Flexible(
                fit: FlexFit.loose,
                child: Row(
                  children: [
                    SizedBox(),
                    tCal.text == null
                        ? Text(targetCal.toString())
                        : Text(tCal.text),
                    ElevatedButton(
                        onPressed: () {
                          SubmitCal();
                        },
                        child: Text('Change goal'))
                  ],
                ),
              )
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CalorieApp'),
          actions: [
            IconButton(
                onPressed: () {
                  calSheet(context);
                },
                icon: Icon(Icons.food_bank_outlined)),
            IconButton(
                onPressed: () {
                  sheet(context);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Chart(foodHere: _recentTx, targetCal: targetCal),
              HomeScreen(foodHere: foodHere, removeMeal: removeMeal),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              sheet(context);
            }));
  }
}
