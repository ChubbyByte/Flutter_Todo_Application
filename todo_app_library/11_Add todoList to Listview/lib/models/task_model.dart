class TaskModel {
  final String id;
  final String title;
  final String description;
  final String date;

  TaskModel({
    this.id,
    this.title,
    this.description,
    this.date,
  });

  void insert(int i, List<TaskModel> myTaskLists) {}
}
