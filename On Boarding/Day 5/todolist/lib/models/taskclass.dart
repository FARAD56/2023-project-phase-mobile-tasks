enum Status { pending, completed }

class Task {
  String _title;
  String _description;
  String _dueDate;
  Status _status;

  Task(this._title, this._description, this._dueDate)
      : _status = Status.pending;

  void setTitle(String title) {
    _title = title;
  }

  void setDescription(String description) {
    _description = description;
  }

  void setDate(String dueDate) {
    _dueDate = dueDate;
  }

  void setStatus(Status status) {
    _status = status;
  }

  String getTitle() => _title;

  String getDescription() => _description;

  String getDate() => _dueDate;

  Status getStatus() => _status;
}

class TaskManager {
  List<Task> tasks = [];
}

TaskManager taskManager = TaskManager();
