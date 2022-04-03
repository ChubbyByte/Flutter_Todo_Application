import 'package:flutter/material.dart'; //cSpell:disable

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
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter task Title',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.grey.shade400,
                  )),
            ),
            // TextField(),
            // TextField(),
          ],
        ),
      )),
    );
  }
}
