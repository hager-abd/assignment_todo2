import 'package:assignment_todo/sqltodo/todoModel.dart';
import 'package:flutter/material.dart';

import 'sqltodo/todoController.dart';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  void initState() {
    super.initState();
    todoController.getTods().then((value) {
      print(todoController.todos);
    });
  }

  final Controller todoController = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Todos App"),
          backgroundColor: Colors.blue,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemCount: todoController.todos.length,
            itemBuilder: (_, int index) {
              TodoModel me = todoController.todos[index];
              return ListTile(
                tileColor: Colors.blue,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20), bottom: Radius.circular(20)),
                ),
                title: Text(me.title),
                subtitle: Text(me.description),
                leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(index.toString())),
                trailing: StatefulBuilder(builder: (_, setModelState) {
                  return InkWell(
                    onTap: () {
                      me.isDone = me.isDone == 0 ? 1 : 0;
                      setModelState(() {});
                    },
                    child: Center(
                      child: Column(children: [
                        AnimatedContainer(
                          height: 20,
                          width: 20,
                          duration: const Duration(
                            seconds: 2,
                          ),
                          child: me.isDone == 0
                              ? const Icon(Icons.check_circle_outline,
                                  color: Colors.grey) // Icon for incomplete
                              : const Icon(Icons.check_circle,
                                  color: Colors.green), // Icon for done
                        ),
                      ]),
                    ),
                  );
                }),
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(height: 10);
            },
          ),
        ));
  }
}
