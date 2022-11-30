import 'package:flutter/material.dart';
import '../models/model1.dart';
import 'package:intl/intl.dart';

class ItemsList extends StatelessWidget {
  @override
  List<Calorie> foodHere;
  final Function removeTx;
  ItemsList({this.foodHere,this.removeTx});

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Container(
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: ListView.builder(
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            elevation: 5,
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 35,
                                child: Text('${foodHere[index].calories}'),
                              ),
                              title: Text('${foodHere[index].title}'),
                              subtitle: Text(
                                  '${DateFormat.yMMMd().format(foodHere[index].date)}'),
                              trailing: IconButton(
                                  onPressed: () {
                                    removeTx(foodHere[index].id);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                  itemCount: foodHere.length),
            ),
          ),
        ],
      ),
    );
  }
}
