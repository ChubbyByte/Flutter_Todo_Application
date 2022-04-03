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
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextEditingController _taskController = TextEditingController();
  TextEditingController _descripptionController = TextEditingController();
  TextEditingController _todoController = TextEditingController();

  //! task detials
  String title;
  String description;
  // List<TodoModel> _todos = [];
  List<String> _todoInfos = [];

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
        builder: (BuildContext context, Widget child, MainScopedModel model) {
      List<TodoModel> _myTodos =
          widget.taskId != null ? model.getTaskTodos(widget.taskId) : [];
      return Scaffold(
        key: _scaffoldKey,
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            onSubmit(model.addTask, model.addTodo);
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
            ),
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
                  controller: _taskController,
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
                    // _taskController.text = "";
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _descripptionController,
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
                    // _descripptionController.text = "";
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
                          itemCount: _todoInfos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TodoItem(
                              todoItem: _todoInfos[index],
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
                          controller: _todoController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter todo here?',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.greenAccent,
                            ),
                          ),
                          onSubmitted: (String value) {
                            setState(() {
                              if (value.isNotEmpty) {
                                // TodoModel todo = TodoModel(
                                //   todoInfo: value,
                                // );
                                // _todos.insert(0, todo);

                                _todoInfos.add(value);
                                _todoController.text = "";
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
  void onSubmit(Function addTask, Function addTodo) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      if (_todoInfos.isNotEmpty) {
        _taskController.text = "";
        _descripptionController.text = "";
        Map<String, dynamic> myDaToSend = {
          'title': title,
          'description': description
        };

        final Map<String, dynamic> response = await addTask(myDaToSend);

        if (response["success"]) {
          final taskId = response['taskId'];
          Map<String, dynamic> todo = {
            'taskId': taskId,
            'todoInfos': _todoInfos.join(","), //* example: Buy yam, buy cola
          };

          final bool todoResponse = await addTodo(todo);
          if (todoResponse) {
            _todoInfos = [];
            Navigator.of(context).pop();
            final mySnackBar = SnackBar(
              content: Text('Task added succeccfully'),
            );
            // Scaffold.of(context).showSnackBar(mySnackBar);
            _scaffoldKey.currentState.showSnackBar(mySnackBar);
            // Navigator.of(context).pop(); //back to HomePage
            // print('pushing the 1st todo was successful');
          }
          print('the task id was returned: ${response["taskId"]}');
        } else if (response['error']) {
          // Navigator.of(context).pop();
          final mySnackBar = SnackBar(
            content: Text('Failed to add task'),
          );
          _scaffoldKey.currentState.showSnackBar(mySnackBar);
          // print('the error: ${response['error']}\nfailed to save data!!!');
        }
      } else {
        // _taskController.text = title;
        // _descripptionController.text = description;
        final mySnackBar = SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Todo is Empty!!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
        _scaffoldKey.currentState.showSnackBar(mySnackBar);
        // print('todo is Empty!!');
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
