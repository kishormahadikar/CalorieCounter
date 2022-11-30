import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddItem extends StatefulWidget {
  final Function addDets;
  AddItem({this.addDets});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final titleController = TextEditingController();
  DateTime selectedDate;
  final calorieController = TextEditingController();

  void SubmitData() {
    final titlee = titleController.text;
    final caloriess = int.parse(calorieController.text);
    if (titlee.isNotEmpty && caloriess > 0 && selectedDate!=null)  {
      widget.addDets(titlee, caloriess, selectedDate );
      Navigator.of(context).pop();
    } else {
      return;
    }
  }

  void datePicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((value) {
      if (value != null) {
        setState(() {
          selectedDate = value;
        });
        ;
      } else {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Name of the meal'),
          controller: titleController,
          onSubmitted: (_) {
            SubmitData();
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'No of calories'),
          controller: calorieController,
          onSubmitted: (_) {
            SubmitData();
          },
        ),
        Row(
          children: [
            selectedDate == null
                ? Text('No date selected')
                : Text(DateFormat.yMMMd().format(selectedDate)),
            TextButton(
                onPressed: () {
                  datePicker(context);
                },
                child: Text('Select date')),
          ],
        ),
        ElevatedButton(onPressed: SubmitData, child: Text('Submit meals'))
      ],
    ));
  }
}
