import 'package:assignment_todo/text.dart';
import 'package:flutter/material.dart';

import 'sqltodo/todoController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController id = TextEditingController();
  int isDone = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TO DO", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF021526),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 50,
            child: Image.asset(
              "assets/images/to-do-list.png",
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF021526),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20), bottom: Radius.circular(20)),
                ),
                title: Text(
                  "Finish Flutter Project",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Complete the TO-DO app",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    child:
                        Icon(Icons.close, color: Color(0xFF021526), size: 30)),
                trailing: Icon(Icons.more_vert_outlined,
                    color: Colors.white, size: 30),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF021526),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                tileColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20), bottom: Radius.circular(20)),
                ),
                title: const Text(
                  "Gym Workout",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "Exercise routine",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                leading: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.check,
                      color: Color(0xFF021526),
                      size: 30,
                    )),
                trailing: PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert_outlined,
                      color: Colors.white, size: 30),
                  onSelected: (String value) {
                    if (value == 'update') {
                      showModalBottomSheet(
                        backgroundColor: Color(0xFF021526),
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return DraggableScrollableSheet(
                            expand: false,
                            initialChildSize: 0.7,
                            minChildSize: 0.3,
                            maxChildSize: 0.9,
                            builder: (BuildContext context,
                                ScrollController scrollController) {
                              return Column(
                                children: [
                                  const Text(
                                    "Update TO-DO",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 33),
                                  ),
                                  const SizedBox(height: 20),
                                  text_back(
                                    controller: title,
                                    labelText: "Title",
                                  ),
                                  const SizedBox(height: 20),
                                  text_back(
                                      controller: description,
                                      labelText: "Description"),
                                  const SizedBox(height: 20),
                                  const SizedBox(height: 20),
                                  text_back(controller: id, labelText: "ID"),
                                  const SizedBox(height: 20),
                                  StatefulBuilder(builder: (_, setModelState) {
                                    return InkWell(
                                      onTap: () {
                                        isDone = isDone == 0 ? 1 : 0;
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
                                            child: isDone == 0
                                                ? const Icon(
                                                    Icons.check_circle_outline,
                                                    color: Colors
                                                        .grey) // Icon for incomplete
                                                : const Icon(Icons.check_circle,
                                                    color: Colors
                                                        .green), // Icon for done
                                          ),
                                        ]),
                                      ),
                                    );
                                  }),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      Todocontroller todoController =
                                          Todocontroller();
                                      todoController.updateTodo(
                                          int.tryParse(id.text) ?? 0,
                                          title: title.text,
                                          description: description.text,
                                          isDone: isDone);
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Update",
                                      style: TextStyle(
                                          color: Color(0xFF021526),
                                          fontSize: 30),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    }
                    if (value == 'open') {
                      Navigator.of(context).pushNamed("/Display");
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    PopupMenuItem(value: 'open', child: Text("Open")),
                    PopupMenuItem(
                      value: 'update',
                      child: Text("Update"),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text("Delete"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            InkWell(
                onTap: () => Navigator.of(context).pushNamed("/todo"),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF021526),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const ListTile(
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                          bottom: Radius.circular(20)),
                    ),
                    title: Text(
                      "Read a Book",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Finish reading the current book",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.close,
                            color: Color(0xFF021526), size: 30)),
                    trailing: Icon(Icons.more_vert_outlined,
                        color: Colors.white, size: 30),
                  ),
                )),
            const SizedBox(height: 300),
            InkWell(
              onTap: () => {},
              child: Container(
                margin: const EdgeInsets.only(left: 300),
                height: 50,
                width: 50,
                decoration: const BoxDecoration(color: Color(0xFF021526)),
                child: IconButton(
                  icon: const Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Color(0xFF021526),
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return DraggableScrollableSheet(
                          expand: false,
                          initialChildSize: 0.7,
                          minChildSize: 0.3,
                          maxChildSize: 0.9,
                          builder: (BuildContext context,
                              ScrollController scrollController) {
                            return Column(
                              children: [
                                const Text(
                                  "Add TO-DO",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 33),
                                ),
                                const SizedBox(height: 20),
                                text_back(
                                  controller: title,
                                  labelText: "Title",
                                ),
                                const SizedBox(height: 20),
                                text_back(
                                    controller: description,
                                    labelText: "Description"),
                                const SizedBox(height: 20),
                                StatefulBuilder(builder: (_, setModelState) {
                                  return InkWell(
                                    onTap: () {
                                      isDone = isDone == 0 ? 1 : 0;
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
                                          child: isDone == 0
                                              ? const Icon(
                                                  Icons.check_circle_outline,
                                                  color: Colors
                                                      .grey) // Icon for incomplete
                                              : const Icon(Icons.check_circle,
                                                  color: Colors
                                                      .green), // Icon for done
                                        ),
                                      ]),
                                    ),
                                  );
                                }),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Todocontroller todoController =
                                        Todocontroller();
                                    todoController.addTodo(
                                        title: title.text,
                                        description: description.text,
                                        isDone: isDone);
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Add",
                                    style: TextStyle(
                                        color: Color(0xFF021526), fontSize: 30),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
