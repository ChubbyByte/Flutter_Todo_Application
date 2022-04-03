import 'package:flutter/material.dart';
import 'package:todo_app/widgets/checkbox.dart'; //cSpell:disable

class TodoItem extends StatelessWidget {
  // const TodoItem({Key? key}) : super(key: key);

  final String todoItem;

  TodoItem({this.todoItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CheckBox(),
          SizedBox(
            width: 10,
          ),
          Text(
            '$todoItem',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
