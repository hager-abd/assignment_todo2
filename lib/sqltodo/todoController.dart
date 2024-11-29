import 'package:assignment_todo/sqltodo/sql.dart';
import 'package:assignment_todo/sqltodo/todoModel.dart';
import 'package:flutter/cupertino.dart';

class Todocontroller {
  List<TodoModel> todos = [];
  final _Sql = Sql();

  Future<void> getTods() async {
    await _Sql.read("todo").then(
      (response) {
        todos = response.map((todo) => TodoModel.asTODO(todo)).toList();
      },
    );
  }

  void addTodo({
    required String title,
    required String description,
    required int isDone,
  }) {
    _Sql.create(
      "todo",
      data: {
        "title": title,
        "description": description,
        "isDone": isDone,
      },
    ).then((response) {
      if (response >= 0) {
        todos.add(TodoModel(response,
            title: title, description: description, isDone: isDone));
      } else {
        debugPrint("ErrorControllerAdd: $response");
      }
    });
  }

  void updateTodo(
    int id, {
    required String title,
    required String description,
    required int isDone,
  }) {
    _Sql.update(
      "todo",
      data: {
        "title": title,
        "description": description,
        "isDone": isDone == 0 ? 0 : 1,
      },
      condition: "id == $id",
    ).then((response) {
      if (response == true) {
        TodoModel todo = todos.firstWhere((todo) => todo.id == id);
        todo.updateTodo(
            title: title,
            description: description,
            isDone: isDone == 0 ? false : true);
      } else {
        debugPrint("Error: $response");
      }
    });
  }

  void deleteTodo(int id) {
    _Sql.delete(
      "todo",
      condition: "id == $id",
    ).then((response) {
      if (response == true) {
        todos.removeWhere((todo) => todo.id == id);
      } else {
        debugPrint("Error: $response");
      }
    });
  }

  void dropTodo() {
    _Sql.drop();
  }
}
