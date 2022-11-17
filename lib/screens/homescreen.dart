import 'dart:convert';

import 'package:checkbox/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var jsonResult;
  bool isLoading = true;
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

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool showValue = false;

    return SafeArea(
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
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
                      child: inputBox(jsonResult['totalBox'], width)),
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
                              // mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CheckboxListTile(
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  title: const Text("a"),
                                  value: showValue,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      showValue = value!;
                                    });
                                  },
                                ),
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
