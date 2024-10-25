class TodoModel {
  int id;
  String title;
  String description;
  int isDone;

  TodoModel(this.id,
      {required this.title,
      required this.description,
      required this.isDone}); //addTodo

  String get asString =>
      "id:$id, title:$title, description:$description,isDone:$isDone";

  updateTodo(
      {required String title,
      required String description,
      required bool isDone}) {
    this.title = title;
    this.description = description;
    this.isDone = isDone ? 1 : 0;
  }

  static TodoModel asTODO(Map<String, dynamic> map) {
    //getTodos
    return TodoModel(map['id'],
        title: map['title'],
        description: map['description'],
        isDone: map['isDone']);
  }
}
