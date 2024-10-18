import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Column(children: [
          InkWell(
            onTap: () => Navigator.of(context).pushNamed("/home"),
            child: Hero(
              tag: "assets/images/to-do-list.png",
              child: Image.asset(
                "assets/images/to-do-list.png",
                fit: BoxFit.fitHeight,
                height: 100,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "TO-DO",
            style: TextStyle(
                fontSize: 30,
                color: Color(0xFF021526),
                fontWeight: FontWeight.bold),
          ).animate().fade(duration: 3.seconds),
          const SizedBox(
            height: 20,
          ),
          const Text("organize Your Day,One Task at a Time",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              )).animate().scale(duration: 1.seconds),
        ])),
      ),
      bottomSheet: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    );
  }
}
