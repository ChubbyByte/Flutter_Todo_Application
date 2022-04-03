import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/scopedModels/main_scoped_model.dart';
import 'package:todo_app/widgets/checkbox.dart';
import 'package:todo_app/widgets/todo_item.dart'; //cSpell:disable

class TaskPage extends StatefulWidget {
  final String taskId;
  TaskPage({this.taskId});

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  GlobalKey<FormState> _formKey = GlobalKey();

  //! task detials
  String title;
  String description;
  List<TodoModel> _todos = [];

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, MainScopedModel model) {
      List<TodoModel> _myTodos =
          widget.taskId != null ? model.getTaskTodos(widget.taskId) : [];
      return Scaffold(
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            onSubmit(model.addTask);
            if (model.isLoading) {
              showAlertDialog(context);
            }
          },
          child: const Icon(Icons.save_alt_sharp),
          backgroundColor: Colors.greenAccent,
          focusColor: Colors.blue,
          foregroundColor: Colors.black,
          hoverColor: Colors.cyanAccent,
          splashColor: Colors.black,
        ),
        appBar: AppBar(
          title: Text('Add Task'),
          actions: [
            // IconButton(
            //   onPressed: () {
            //     onSubmit(model.addTask);
            //     if (model.isLoading) {
            //       showAlertDialog(context);
            //     }
            //   },
            //   icon: Icon(Icons.save_alt_sharp),
            // ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
            )
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
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
                  validator: (String value) {
                    String errorMessage;
                    if (value.isEmpty) {
                      errorMessage = "This field is required!";
                    }
                    return errorMessage;
                  },
                  onSaved: (String value) {
                    title = value.trim();
                  },
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
                    color: Colors.black54,
                  ),
                  validator: (String value) {
                    String errorMessage;
                    if (value.isEmpty) {
                      errorMessage = "This field is required!";
                    }
                    return errorMessage;
                  },
                  onSaved: (String value) {
                    description = value.trim();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: widget.taskId != null
                      ? ListView.builder(
                          itemCount: _myTodos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TodoItem(
                              todoItem: _myTodos[index].todoInfo,
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: _todos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TodoItem(
                              todoItem: _todos[index].todoInfo,
                            );
                          },
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
                          onSubmitted: (String value) {
                            setState(() {
                              if (value.isNotEmpty) {
                                TodoModel todo = TodoModel(
                                  todoInfo: value,
                                );
                                _todos.insert(0, todo);
                              }
                            });

                            print('the text submitted: $value');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // TextField(),
              ],
            ),
          ),
        )),
      );
    });
  }

  //! check after put title and description
  void onSubmit(Function addTask) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Map<String, dynamic> myDaToSend = {
        'title': title,
        'description': description
      };

      final response = await addTask(myDaToSend);
      if (response) {
        // Navigator.of(context).pop();
        // Navigator.of(context).pop(); //back to HomePage
        print('Data Saved!');
      } else {
        Navigator.of(context).pop();
        print('somthing went wrong!\nfailed to save data!!!');
      }

      //! debug in console...
      // print('The title: $title\ndescription: $description');
    }
  }

  showAlertDialog(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 10),
            Text('Loading...'),
          ],
        ));
      },
    );
  }
}
