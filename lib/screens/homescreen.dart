import 'dart:convert';

import 'package:checkbox/screens/test.dart';
import 'package:checkbox/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var jsonResult;
  bool isLoading = true;
  List<Check> checkBoxList = [];
  List<Check> checkBoxList2 = [];
  int cbCount = 1;
  int alphaCount = 1;
  bool tf1 = true;

  TextEditingController maxNumController = TextEditingController();
  TextEditingController maxAlphaController = TextEditingController();
  TextEditingController selectableBoxController = TextEditingController();
  TextEditingController allTotalBoxes = TextEditingController();

  String? resultText;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadJsonText();
    });
  }

  loadJsonText() async {
    String data = await rootBundle.loadString('assets/text.json');
    jsonResult = json.decode(data);
    setState(() {
      isLoading = false;
    });
  }

  getWidgetReady(int number) {
    for (int index = 0; index < number; index++) {
      List alpha = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k"];
      checkBoxList.add(Check(value: (index + 1).toString(), checkBool: false));
      checkBoxList2
          .add(Check(value: (alpha[index]).toString(), checkBool: false));
    }
    setState(() {});
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
                  Get.to(Test());
                },
              ),
              bottomNavigationBar: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        checkBoxList2.clear();
                        checkBoxList.clear();
                        allTotalBoxes.clear();
                        alphaCount = 1;
                        cbCount = 1;
                        selectableBoxController.clear();
                        maxAlphaController.clear();
                        maxNumController.clear();
                      });
                    },
                    child: Container(
                      color: Colors.purple,
                      width: width / 3,
                      height: height / 15,
                      child: Text(jsonResult['reset'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                  Container(
                    color: resultText == null ? Colors.red : Colors.green,
                    width: width - width / 3,
                    height: height / 15,
                    child: Center(
                        child: Text(resultText ?? "Waiting",
                            style: const TextStyle(color: Colors.white))),
                  )
                ],
              ),
              body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Column(
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
                                    controller: allTotalBoxes,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp("^(1[01]|[1-9])\$")),
                                    ],
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        tf1 = false;
                                      });
                                      try {
                                        if (int.parse(value) <= 11) {
                                          getWidgetReady(int.parse(value));
                                        } else {
                                          checkBoxList.clear();
                                          checkBoxList2.clear();
                                        }
                                      } catch (e) {
                                        checkBoxList.clear();
                                        checkBoxList2.clear();
                                      }
                                    },
                                    enabled: tf1,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(jsonResult['selectableBox']),
                                  hSpacer(15),
                                  SizedBox(
                                    height: width / 12,
                                    width: width / 12,
                                    child: TextFormField(
                                      // validator: (value) {},
                                      keyboardType: TextInputType.number,
                                      controller: selectableBoxController,
                                      onChanged: (value) {
                                        try {
                                          if (int.parse(selectableBoxController
                                                  .text) <=
                                              int.parse(allTotalBoxes.text)) {
                                            return;
                                          } else {
                                            setState(() {
                                              selectableBoxController.clear();
                                            });
                                            Fluttertoast.showToast(
                                                msg: jsonResult[
                                                    'maxAlpha!=total']);
                                          }
                                          checkBoxList2.clear();
                                          checkBoxList.clear();
                                          maxNumController.clear();
                                          maxAlphaController.clear();
                                          getWidgetReady(
                                              int.parse(allTotalBoxes.text));
                                        } catch (e) {
                                          setState(() {
                                            selectableBoxController.clear();
                                          });
                                        }
                                        if (value == null) {
                                          setState(() {
                                            selectableBoxController.clear();
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                  hSpacer(10),
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(jsonResult['maxAlpha']),
                                  hSpacer(15),
                                  SizedBox(
                                    height: width / 12,
                                    width: width / 12,
                                    child: TextFormField(
                                      // validator: (value) {},
                                      keyboardType: TextInputType.number,
                                      controller: maxAlphaController,
                                      onChanged: (value) {
                                        try {
                                          if (int.parse(
                                                  maxAlphaController.text) <=
                                              int.parse(selectableBoxController
                                                  .text)) {
                                            return;
                                          } else {
                                            setState(() {
                                              maxAlphaController.clear();
                                            });
                                            Fluttertoast.showToast(
                                                msg: jsonResult[
                                                    'maxAlpha!=total']);
                                          }
                                          checkBoxList2.clear();
                                          checkBoxList.clear();
                                          maxNumController.clear();
                                          getWidgetReady(
                                              int.parse(allTotalBoxes.text));
                                        } catch (e) {
                                          setState(() {
                                            maxAlphaController.clear();
                                          });
                                        }
                                        if (value == null) {
                                          setState(() {
                                            maxAlphaController.clear();
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                  hSpacer(10),
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(jsonResult['maxNum']),
                                  hSpacer(15),
                                  SizedBox(
                                    height: width / 12,
                                    width: width / 12,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: maxNumController,
                                      onChanged: (value) {
                                        try {
                                          if (int.parse(
                                                  maxNumController.text) <=
                                              int.parse(selectableBoxController
                                                      .text) -
                                                  int.parse(maxAlphaController
                                                      .text)) {
                                            return;
                                          } else {
                                            setState(() {
                                              maxNumController.clear();
                                            });
                                            Fluttertoast.showToast(
                                                msg: jsonResult['max!=total']);
                                          }
                                          getWidgetReady(
                                              int.parse(allTotalBoxes.text));
                                        } catch (e) {
                                          setState(() {
                                            maxNumController.clear();
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                  hSpacer(10),
                                ]),
                          )
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
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: checkBoxList.length,
                                  itemBuilder: (context, int index) =>
                                      CheckboxListTile(
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        title: Text(checkBoxList[index].value),
                                        value: checkBoxList[index].checkBool,
                                        onChanged: (value) {
                                          try {
                                            setState(() {
                                              if (cbCount <=
                                                  int.parse(
                                                      maxNumController.text)) {
                                                checkBoxList[index].checkBool =
                                                    value!;
                                                cbCount++;
                                              } else {
                                                setState(() {
                                                  resultText =
                                                      "Unable to select as Max no of Numbers reached ${maxNumController.text}";
                                                });
                                              }
                                            });
                                          } catch (e) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "Enter number to select box");
                                          }
                                        },
                                      )),
                            )),
                        Container(
                          height: height - height / 15 - height / 3.4,
                          width: width / 2,
                          decoration: BoxDecoration(border: Border.all()),
                          child: SingleChildScrollView(
                              child: SingleChildScrollView(
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: checkBoxList2.length,
                                itemBuilder: (context, int index) =>
                                    CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text(checkBoxList2[index].value),
                                      value: checkBoxList2[index].checkBool,
                                      onChanged: (value) {
                                        try {
                                          setState(() {
                                            if (alphaCount <=
                                                    int.parse(
                                                        maxAlphaController.text)

                                                // && (alphaCount + cbCount) <=
                                                // int.parse(allTotalBoxes.text)
                                                ) {
                                              checkBoxList2[index].checkBool =
                                                  value!;
                                              alphaCount++;
                                            } else {
                                              setState(() {
                                                resultText =
                                                    "Unable to select as Max no of Numbers reached ${maxNumController.text}";
                                              });
                                            }
                                          });
                                        } catch (e) {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Enter number to select box");
                                        }
                                      },
                                    )),
                          )),
                        )
                      ],
                    )
                  ],
                ),
              ),
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
