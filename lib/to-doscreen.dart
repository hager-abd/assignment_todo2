import 'package:flutter/material.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "flutter",
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Read a Book",
                  style: TextStyle(color: Colors.white)),
              backgroundColor: const Color(0xFF021526),
              leading: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.white,
                ),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
            ),
            body: const Center(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFF021526),
                    child: Icon(
                      Icons.close,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),

//Icon(Icons.close ,size:100,color: Colors.white,)
                  Text("Read a Book",
                      style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF021526),
                          fontWeight: FontWeight.bold)),
                  Text("Finish reading the current book",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      )),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        " Choose a book from your reading list and spend at least 30 minutes enjoying it.Aim to finish a chapter or a set number of pages",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF021526),
                        )),
                  ),
                ],
              ),
            )));
  }
}
