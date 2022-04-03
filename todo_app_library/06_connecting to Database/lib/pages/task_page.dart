import 'package:flutter/material.dart';
import 'package:todo_app/widgets/checkbox.dart';
import 'package:todo_app/widgets/todo_item.dart'; //cSpell:disable

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                // border: InputBorder.none,
                hintText: 'Enter task Title',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.grey.shade400,
                ),
              ),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.pinkAccent,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                // border: InputBorder.none,
                hintText: 'Description',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.grey.shade400,
                ),
              ),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.orangeAccent.shade700,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: [],
              ),
            ),
            Container(
              height: 55,
              // width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CheckBox(),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter todo here?',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // TextField(),
          ],
        ),
      )),
    );
  }
}
