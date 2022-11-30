import 'package:flutter/material.dart';
import '../models/model1.dart';
import '../widgets/item_list.dart';

class HomeScreen extends StatefulWidget {
  final Function ItemList;
  final Function removeMeal;
  List<Calorie> foodHere;

  HomeScreen({this.ItemList, this.foodHere, this.removeMeal});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  List<Calorie> get _recentTx {
    return widget.foodHere.where((element) =>
        element.date.isAfter(DateTime.now().subtract(Duration(days: 7))));
  }

  Widget build(BuildContext context) {
    return widget.foodHere.isEmpty
        ? Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text('No meals added'),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 4),
                  height: MediaQuery.of(context).size.height / 2,
                  child: Image.asset(
                    'images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                ItemsList(
                  foodHere: widget.foodHere,
                  removeTx: widget.removeMeal,
                )
              ],
            ),
          );
  }
}
