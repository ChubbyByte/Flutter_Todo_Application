import 'package:flutter/material.dart'; //cSpell:disable

class TaskCard extends StatelessWidget {
  // const TaskCard({Key? key}) : super(key: key);

  final String title;
  final String description;
  final String date;

  TaskCard({this.title, this.description, this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black26,
            offset: Offset(0, 5),
          )
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '$description',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.grey),
            ),
            Text(
              '$date',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
