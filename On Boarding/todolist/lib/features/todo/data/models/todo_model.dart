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
    'deadLine': deadLine,
    'id':id
  };

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json['title'] as String,
      description: json['description'] as String,
      deadLine: json['deadLine'] as String,
      id: json['id'] as int,
    );
  }
}
