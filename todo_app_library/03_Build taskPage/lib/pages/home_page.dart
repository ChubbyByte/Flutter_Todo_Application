import 'package:flutter/material.dart';
import 'package:todo_app/pages/task_page.dart';
import 'package:todo_app/widgets/task_card.dart'; //cSpell:disable

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            GestureDetector(
              onTap: () {
                //* go to the task page [edite task]
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => TaskPage(),
                  ),
                );
              },
              child: TaskCard(
                  title: 'Somthing',
                  description: 'this is description about Somthing.'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //* go to the task page [add new task]
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => TaskPage(),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
