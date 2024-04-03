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
    for (Task task in tasks){
        print(task.title);
    }
    return tasks;
  }

  List<Task> viewOnlyCompletedTasks(){
    for (Task task in tasks){
      if (task.status == 'completed'){
        print(task.title);
      }
    }
    return tasks.where((task) => task.status == 'completed').toList();
  }

  List<Task> viewOnlyPendingTasks(){
    for (Task task in tasks){
      if (task.status == 'pending'){
        print(task.title);
      }
    }
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

void main(){
  Map<int, String> status = {0: 'pending', 1:'completed'};

  TaskManager tm = TaskManager();
  tm.addNewTask('a', 'b', 'c', null);

  for (int i=0; i <10; i++){
    tm.addNewTask('title' + (i+1).toString(), 'description', status[i%2], null);
  }
  tm.viewAllTasks();
  print('');
  tm.deleteTask(0);
  tm.viewOnlyCompletedTasks();
  print('');
  tm.viewOnlyPendingTasks();

}