class Task {
  String _title;
  String _description;
  String _dueDate;

  Task(this._title, this._description, this._dueDate);

  void setTitle(String title) {
    _title = title;
  }

  void setDescription(String description) {
    _description = description;
  }

  void setDate(String dueDate) {
    _dueDate = dueDate;
  }

  String getTitle() => _title;

  String getDescription() => _description;

  String getDate() => _dueDate;
}

class TaskManager {
  List<Task> tasks = [];
}

TaskManager taskManager = TaskManager();


