import 'dart:convert';

import 'package:checkbox/screens/test.dart';
import 'package:checkbox/screens/test2.dart';
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
  bool aa1 = false;
  bool a1 = false;
  List aplhaCB = [];
  List numericCB = [];
  List displayTextField = [];
  List displayTextField2 = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadJsonText();
    });

    numericCB = [
      {
        "value": aa1,
        "checkBox": CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text("1"),
          value: aa1,
          onChanged: (value) {
            print("value $value");
            setState(() {
              aa1 = !value!;
            });
          },
        ),
      },
      {
        "checkBox": CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text("2"),
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
          title: const Text("3"),
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
          title: const Text("4"),
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
          title: const Text("5"),
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
          title: const Text("6"),
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
          title: const Text("7"),
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
          title: const Text("8"),
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
          title: const Text("9"),
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
          title: const Text("10"),
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
          title: const Text("11"),
          value: a1,
          onChanged: (bool? value) {
            setState(() {
              a1 = value!;
            });
          },
        ),
      },
    ];

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
          title: const Text("b"),
          value: a1,
          onChanged: (value) {
            setState(() {
              a1 = value!;
            });
          },
        ),
      },
      {
        "checkBox": CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text("c"),
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
          title: const Text("d"),
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
          title: const Text("e"),
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
          title: const Text("f"),
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
          title: const Text("g"),
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
          title: const Text("h"),
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
          title: const Text("i"),
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
          title: const Text("j"),
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
          title: const Text("k"),
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
    // bool showValue = false;

    return SafeArea(
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.to(const Test2());
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
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp("^(1[01]|[1-9])\$")),
                                  ],
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
                                            if (numericCB.length ==
                                                displayTextField2.length) {
                                              return;
                                            } else {
                                              displayTextField2.add(numericCB[
                                                  displayTextField2.length]);
                                            }
                                          });
                                        }
                                      } else {
                                        if (displayTextField.isNotEmpty) {
                                          displayTextField.clear();
                                        }
                                        if (displayTextField2.isNotEmpty) {
                                          displayTextField2.clear();
                                        }
                                      }
                                    } catch (e) {
                                      if (displayTextField.isNotEmpty) {
                                        displayTextField.clear();
                                      }
                                      if (displayTextField2.isNotEmpty) {
                                        displayTextField2.clear();
                                      }
                                    }
                                  },
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
                            children: [
                              ...displayTextField2
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
