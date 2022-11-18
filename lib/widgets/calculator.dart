import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int cbCount = 0;
  @override
  void initState() {
    super.initState();
    // getWidgetReady(5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: checkBoxListWidget(checkBoxList, context),
    );
  }

  List<Check> checkBoxList = [];

  getWidgetReady(int number) {
    for (int index = 0; index < number; index++) {
      checkBoxList.add(Check(value: (index + 1).toString(), checkBool: false));
    }
    setState(() {});
  }

  checkBoxListWidget(List<Check> checkBoxList, BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              getWidgetReady(int.parse(value));
            },
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: checkBoxList.length,
              itemBuilder: (context, int index) => CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(checkBoxList[index].value),
                    value: checkBoxList[index].checkBool,
                    onChanged: (value) {
                      setState(() {
                        if (cbCount < 3) {
                          checkBoxList[index].checkBool = value!;
                          cbCount++;
                        } else {
                          print("NOT ALLOWED");
                        }
                      });
                    },
                  )),
        ],
      ),
    );
  }
}

class Check {
  bool checkBool = false;
  String value = '';
  Check({
    required this.checkBool,
    required this.value,
  });
}
