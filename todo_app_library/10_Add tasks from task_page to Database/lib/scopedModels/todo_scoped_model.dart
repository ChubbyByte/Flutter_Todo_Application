import 'dart:async';
import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/models/todo_model.dart'; //cSpell:disable
import 'package:http/http.dart' as http;

class TodoScopedModel extends Model {
  List<TodoModel> _todos = [];
  List<TaskModel> _tasks = [];

  bool _isLoading = false;

  //*copy of original List'_todos'
  List<TodoModel> get todos => List.from(_todos); //!short form of above^^^
  List<TaskModel> get tasks {
    return List.from(_tasks);
  }

  bool get isLoading {
    return _isLoading;
  }

  //*to used http must import this first package 'package:http/http.dart'
  void fetchTodos() async {
    try {
      final String apiEndPoint =
          "http://192.168.1.15/todo_db/api/tables/getData_todo.php";
      final Uri url = Uri.parse(apiEndPoint);
      final http.Response response = await http.get(url);

      //*convert the response to json
      final List<dynamic> responseDecoded = json.decode(response.body);
      List<TodoModel> _myTodos = [];

      responseDecoded.forEach((data) {
        // print('the data returned : ${data['id']}');
        TodoModel todo = TodoModel(
          id: data['id'],
          taskId: data['taskId'],
          todoInfo: data['todoInfo'],
        );
        // _todos.add(todo);
        _myTodos.insert(0, todo);
      });
      // print('The response decoded : $responseDecoded');
      // print(_todos[0].todoInfo);
      _todos = _myTodos;
      // print(_todos[0].todoInfo);
      notifyListeners();
      // notifyListeners();
    } catch (e) {
      print('the error: $e');
    }
  }

  //* access to task_tables
  void fetchTasks() async {
    try {
      final String apiEndPoint =
          "http://192.168.1.15/todo_db/api/tables/getData_task.php";
      final Uri url = Uri.parse(apiEndPoint);
      final http.Response response = await http.get(url);

      //*convert the response to json
      final List<dynamic> responseDecoded = json.decode(response.body);
      final List<TaskModel> myTaskLists = [];

      responseDecoded.forEach((data) {
        // print('the data returned : ${data['id']}');
        TaskModel task = TaskModel(
          id: data['id'],
          title: data['title'],
          description: data['description'],
          date: data['date'],
        );
        // _tasks.add(task);
        myTaskLists.insert(0, task);
      });
      // print('The response decoded : $responseDecoded');
      // print(_tasks[0].title);
      _tasks = myTaskLists;
      // print(_tasks[0].title);
      print(_tasks[0].date);
      notifyListeners();
      // print(myTaskList);
    } catch (e) {
      print('the error: $e');
    }
  }

  Future<bool> addTask(Map<String, dynamic> myDataToSend) async {
    _isLoading = true;
    notifyListeners();

    // Map<String, dynamic> myDataToSend = {
    //   'title': "Are u ok?",
    //   'description': "OK OK OK"
    // };
    // print(myDataToSend);
    try {
      final String apiEndPoint =
          "http://192.168.1.15/todo_db/api/tables/addTask.php";
      final Uri url = Uri.parse(apiEndPoint);
      final http.Response response = await http.post(url, body: myDataToSend);

      print("the response body: ${response.body}");

      //! debug sending state
      print('the data: $myDataToSend');

      _isLoading = false;
      notifyListeners();

      return Future.value(true); //checking state is done? or NOT!
    } catch (e) {
      _isLoading = false;
      notifyListeners();

      return Future.value(false);

      print('The error: $e');
    }
  }

  List<TodoModel> getTaskTodos(String id) {
    List<TodoModel> _allTaskTodos = [];
    for (int i = 0; i < _todos.length; i++) {
      if (_todos[i].taskId == id) {
        _allTaskTodos.insert(0, _todos[i]);
      }
    }
    return _allTaskTodos;
  }
}
