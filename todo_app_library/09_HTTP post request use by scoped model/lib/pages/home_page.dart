import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todo_app/pages/task_page.dart';
import 'package:todo_app/scopedModels/main_scoped_model.dart';
import 'package:todo_app/widgets/task_card.dart'; //cSpell:disable

class HomePage extends StatefulWidget {
  final MainScopedModel model;
  final String title;
  HomePage({this.title, this.model});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // widget.model.fetchTodos();
    // widget.model.fetchTasks();
    widget.model.fetchAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, MainScopedModel model) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
          //* work like a widget
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: model.tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  //* go to the task page [edite task]
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => TaskPage(
                        taskId: model.tasks[index].id,
                      ),
                    ),
                  );
                },
                child: TaskCard(
                  title: model.tasks[index].title,
                  description: model.tasks[index].description,
                  date: model.tasks[index].date,
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //* go to the task page [add new task]
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (BuildContext context) => TaskPage(),
            //   ),
            // );
            model.addTask();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add_comment),
        ),
      );
    });
  }
}
