enum Status { notStarted, inProgress, completed }

class Task {
  String _title;
  String _description;
  int _id;
  String _dueDate;
  Status _status;

  Task(this._title, this._description, this._dueDate, this._id)
      : _status = Status.notStarted;

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

  int getID() => _id;

  String getDescription() => _description;

  String getDate() => _dueDate;

  Status getStatus() => _status;
}

class TaskManager {
  List<Task> tasks = [];

  int counter = 1;

  void addTask(Task task) {
    tasks.add(task);
  }

  Task getTask(int id) => tasks[id];

  List<Task> viewAllTasks() => tasks;

  List<Task> viewbyStatus(Status status) =>
      tasks.where((task) => task._status == status).toList();
}

TaskManager taskManager = TaskManager();
