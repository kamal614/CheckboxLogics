import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  bool a1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text("b"),
          value: a1,
          onChanged: (value) {
            setState(() {
              a1 = value!;
            });
          },
        ),
      ),
    );
  }
}
