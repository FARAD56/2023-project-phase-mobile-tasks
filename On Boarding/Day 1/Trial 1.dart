class Task{
  String? title;
  String? description;
  String? status;
  DateTime? dueDate;
}

class TaskManager{
  List<Task>  tasks = [];

  void addNewTask(Task task){
    tasks.add(task);
  }

  void addNewTaskParam(String? title, String? description, String? status, DateTime? dueDate){
    var task = Task();
    if (title != null) task.title = title;
    if (description != null)  task.description = description;
    if (status != null) task.status = status;
    if (dueDate != null) task.dueDate = dueDate;
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

  void deleteATask(int index){
    if (index > -1 && index < tasks.length){
      tasks.removeAt(index);
    }
  }

}

void main(){
  var tm = TaskManager();
  tm.addNewTask(Task());

  for (var i=0; i <10; i++){
    tm.addNewTaskParam('title'+ (i+1).toString(), 'description'+(i+1).toString(), 'pending', null);
  }

  for (Task task in tm.viewAllTasks()){
    print(task.title);
  }
}