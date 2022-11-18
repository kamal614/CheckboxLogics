import 'dart:convert';

import 'package:checkbox/screens/test.dart';
import 'package:checkbox/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var jsonResult;
  bool isLoading = true;
  bool a1 = false;
  List aplhaCB = [];
  List displayTextField = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadJsonText();
    });
    aplhaCB = [
      {
        "checkBox": CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text("a"),
          value: a1,
          onChanged: (bool? value) {
            setState(() {
              a1 = value!;
            });
          },
        ),
      },
      {
        "checkBox": CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text("a"),
          value: a1,
          onChanged: (bool? value) {
            setState(() {
              a1 = value!;
            });
          },
        ),
      },
      {
        "checkBox": CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text("a"),
          value: a1,
          onChanged: (bool? value) {
            setState(() {
              a1 = value!;
            });
          },
        ),
      },
      {
        "checkBox": CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text("a"),
          value: a1,
          onChanged: (bool? value) {
            setState(() {
              a1 = value!;
            });
          },
        ),
      },
      {
        "checkBox": CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text("a"),
          value: a1,
          onChanged: (bool? value) {
            setState(() {
              a1 = value!;
            });
          },
        ),
      },
      {
        "checkBox": CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text("a"),
          value: a1,
          onChanged: (bool? value) {
            setState(() {
              a1 = value!;
            });
          },
        ),
      },
      {
        "checkBox": CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text("a"),
          value: a1,
          onChanged: (bool? value) {
            setState(() {
              a1 = value!;
            });
          },
        ),
      },
      {
        "checkBox": CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text("a"),
          value: a1,
          onChanged: (bool? value) {
            setState(() {
              a1 = value!;
            });
          },
        ),
      },
      {
        "checkBox": CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text("a"),
          value: a1,
          onChanged: (bool? value) {
            setState(() {
              a1 = value!;
            });
          },
        ),
      },
      {
        "checkBox": CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text("a"),
          value: a1,
          onChanged: (bool? value) {
            setState(() {
              a1 = value!;
            });
          },
        ),
      },
      {
        "checkBox": CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text("a"),
          value: a1,
          onChanged: (bool? value) {
            setState(() {
              a1 = value!;
            });
          },
        ),
      },
    ];
  }

  loadJsonText() async {
    String data = await rootBundle.loadString('assets/text.json');
    jsonResult = json.decode(data);
    setState(() {
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool showValue = false;

    return SafeArea(
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // Get.to(const DynamicTextField());
                },
              ),
              bottomNavigationBar: Row(
                children: [
                  Container(
                    color: Colors.purple,
                    width: width / 3,
                    height: height / 15,
                    child: Text(jsonResult['reset'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white)),
                  ),
                  Container(
                    color: Colors.green,
                    width: width - width / 3,
                    height: height / 15,
                    child: Center(
                        child: Text(jsonResult['success'],
                            style: const TextStyle(color: Colors.white))),
                  )
                ],
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(jsonResult['totalBox']),
                              hSpacer(15),
                              SizedBox(
                                height: width / 12,
                                width: width / 12,
                                child: TextFormField(
                                  style: const TextStyle(fontSize: 8),
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    try {
                                      if (int.parse(value) <= 11) {
                                        for (int i = 1;
                                            i <= int.parse(value);
                                            i++) {
                                          setState(() {
                                            if (aplhaCB.length ==
                                                displayTextField.length) {
                                              return;
                                            } else {
                                              displayTextField.add(aplhaCB[
                                                  displayTextField.length]);
                                            }
                                          });
                                        }
                                      } else {
                                        if (displayTextField.isNotEmpty) {
                                          displayTextField.clear();
                                        }
                                      }
                                    } catch (e) {
                                      print(">>>>>>>ERROR>>>>>>>");
                                      print(e.toString());
                                      if (displayTextField.isNotEmpty) {
                                        displayTextField.clear();
                                      }
                                    }
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 5.0),
                                      ),
                                      fillColor: Colors.grey,
                                      focusColor: Colors.grey),
                                ),
                              ),
                              hSpacer(10),
                            ]),
                      )),
                  // child: inputBox(jsonResult['totalBox'], width)),
                  Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Column(
                      children: [
                        inputBox(jsonResult['selectableBox'], width),
                        inputBox(jsonResult['maxAlpha'], width),
                        inputBox(jsonResult['maxNum'], width),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          height: height - height / 15 - height / 3.4,
                          width: width / 2,
                          decoration: BoxDecoration(border: Border.all()),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ...displayTextField
                                    .map(
                                      (e) => Row(
                                        children: [
                                          Expanded(child: e['checkBox'])
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ],
                            ),
                          )),
                      Container(
                        height: height - height / 15 - height / 3.4,
                        width: width / 2,
                        decoration: BoxDecoration(border: Border.all()),
                        child: SingleChildScrollView(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: const Text("1"),
                                value: showValue,
                                onChanged: (bool? value) {
                                  setState(() {
                                    showValue = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
