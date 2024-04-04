class Task{
  String? title;
  String? description;
  String? status;
  DateTime? dueDate;

  Task(String? title, String? description, String? status, DateTime? dueDate){
    ///A task constructor
    this.title = title;
    this.description = description;
    this.status = status;
    this.dueDate = dueDate;
  }

}

class TaskManager{
  ///Create a Task-List for the Task Manager
  List<Task>  tasks = [];

  void addNewTask(String? title, String? description, String? status, DateTime? dueDate){
    ///Create new task and add to the Task-list
    Task task = Task(title,description,status,dueDate);
    tasks.add(task);
  }

  List<Task> viewAllTasks(){
    ///Return all Tasks in the Task-list
    return tasks;
  }

  List<Task> viewOnlyCompletedTasks(){
    ///Return only Completed Tasks in the Task-list
    return tasks.where((task) => task.status == 'completed').toList();
  }

  List<Task> viewOnlyPendingTasks(){
    ///Return only pending Tasks in the Task-list
    return tasks.where((task) => task.status == 'pending').toList();
  }

  void editTask(int index, String? title, String? description, String? status, DateTime? dueDate){
    ///Get a Task by index in the Task-list and edit it's properties
    if (index > -1 && index < tasks.length){
      if (title != null) tasks[index].title = title;
      if (description != null)  tasks[index].description = description;
      if (status != null) tasks[index].status = status;
      if (dueDate != null) tasks[index].dueDate = dueDate;
    }
  }

  void deleteTask(int index){
    ///Get a Task by index in the Task-list and remove it from the list
    if (index > -1 && index < tasks.length){
      tasks.removeAt(index);
    }
  }

}
