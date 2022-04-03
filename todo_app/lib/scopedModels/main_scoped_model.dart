import 'package:scoped_model/scoped_model.dart';
import 'package:todo_app/scopedModels/todo_scoped_model.dart'; //cSpell:disable

class MainScopedModel extends Model with TodoScopedModel {
  void fetchAll() {
    fetchTodos();
    fetchTasks();
    // fetchCategories();
  }
}
