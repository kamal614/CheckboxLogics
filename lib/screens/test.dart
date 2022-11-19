import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool enable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                enable = false;
              });
            },
            enabled: enable,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  enable = false;
                });
              },
              child: Text("data"))
        ],
      ),
    );
  }
}
