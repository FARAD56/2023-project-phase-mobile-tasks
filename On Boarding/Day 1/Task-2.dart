class Task{
  String? _title;
  String? _description;
  String? _status;
  DateTime? _dueDate;

  Task(String? title, String? description, String? status, DateTime? dueDate){
    this._title = title;
    this._description = description;
    this._status = status;
    this._dueDate = dueDate;
  }

  void display() {
    print('Title:   ' + this._title);
    print('Description:   ' + this._description);
    print('Due date:   ' + this._dueDate);
    //print('Status:   '+this.status);
  }

  void setTitle(String title) {
    this._title = title;
  }

  void setDescription(String description) {
    this._description = description;
  }

  void setDate(DateTime dueDate) {
    this._dueDate = dueDate;
  }

  void setStatus(String? status) {
    this._status = status;
  }

  String? getTitle() {
    return this._title;
  }

  String? getDescription() {
    return this._description;
  }

  DateTime? getDate() {
    return this._dueDate;
  }

  String? getStatus() {
    return this._status;
  }

}

class TaskManager{
  List<Task>  tasks = [];

  void addNewTask(String? title, String? description, String? status, DateTime? dueDate){
    Task task = Task(title,description,status,dueDate);
    tasks.add(task);
  }

  List<Task> viewAllTasks(){
    return tasks;
  }

  List<Task> viewOnlyCompletedTasks(){
    return tasks.where((task) => task.status == 'completed').toList();
  }

  List<Task> viewOnlyPendingTasks(){
    return tasks.where((task) => task.status == 'pending').toList();
  }

  void editTask(int index, String? title, String? description, String? status, DateTime? dueDate){
    if (index > -1 && index < tasks.length){
      if (title != null) tasks[index].title = title;
      if (description != null)  tasks[index].description = description;
      if (status != null) tasks[index].status = status;
      if (dueDate != null) tasks[index].dueDate = dueDate;
    }
  }

  void deleteTask(int index){
    if (index > -1 && index < tasks.length){
      tasks.removeAt(index);
    }
  }

}
