class TodoModel {
  String title;
  String description;
  final int id;
  String deadLine;

  TodoModel(
      {required this.title,
      required this.description,
      required this.deadLine,
      required this.id}); 

   Map<String,dynamic> toJson() =>{
    'title':title,
    'description':description,
    'deadline': deadLine,
    'ID':id
  };

  TodoModel.fromJson(Map<String,dynamic> json):
      title=json['title'] as String,
      description=json['description'] as String,
      deadLine=json['deadline'] as String,
      id=json['ID'] as int
  ;
}


