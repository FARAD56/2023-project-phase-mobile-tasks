class Task{
  String? title;
  String? description;
  String? status;
  DateTime? dueDate;

  Task(String? title, String? description, String? status, DateTime? dueDate){
    this.title = title;
    this.description = description;
    this.status = status;
    this.dueDate = dueDate;
  }

}

class TaskManager{
  List<Task>  tasks = [];

  void addNewTask(String? title, String? description, String? status, DateTime? dueDate){
    tasks.add(Task(title,description,status,dueDate));
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