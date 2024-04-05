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

  void viewAllTasks(){
    for (Task task in tasks){
      print(task.getTitle());
    }  
  }

  void viewOnlyCompletedTasks(){
    for (Task task in tasks){
        if (task._status == 'completed')
          print(task.getTitle());
    }  
  }

  void viewOnlyPendingTasks(){
    for (Task task in tasks){
      if (task._status == 'pending')
        print(task.getTitle());
    }
  }

  void editTask(int index, String? title, String? description, String? status, DateTime? dueDate){
    if (index > -1 && index < tasks.length){
      if (title != null) tasks[index].setTitle(title);
      if (description != null)  tasks[index].setDescription(description);
      if (status != null) tasks[index].setStatus(status);
      if (dueDate != null) tasks[index].setDate(dueDate);
    }
  }

  void deleteTask(int index){
    if (index > -1 && index < tasks.length){
      tasks.removeAt(index);
    }
  }

}



void main(){
  Map<int, String> status = {0: 'pending', 1:'completed'};

  TaskManager tm = TaskManager();
  tm.addNewTask('a', 'b', 'c', null);

  for (int i=0; i <10; i++){
    tm.addNewTask('title' + (i+1).toString(), 'description', status[i%2], null);
  }
  tm.viewAllTasks();
  tm.editTask(0,'b',null,null,null);
  tm.viewAllTasks();

  print('');
  tm.deleteTask(0);
  tm.viewOnlyCompletedTasks();
  print('');
  tm.viewOnlyPendingTasks();


}