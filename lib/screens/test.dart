import 'package:flutter/material.dart';

class DynamicTextField extends StatefulWidget {
  const DynamicTextField({Key? key}) : super(key: key);

  @override
  State<DynamicTextField> createState() => _DynamicTextFieldState();
}

class _DynamicTextFieldState extends State<DynamicTextField> {
  TextEditingController name = TextEditingController();

//Tax Date
  TextEditingController firstDate = TextEditingController();
  TextEditingController secondDate = TextEditingController();
  TextEditingController lastDate = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List allTextField = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allTextField = [
      {
        "label": "23/09/2021",
        "keyforbackend": "first_date_tax",
        "value": firstDate,
        "text_field": TextFormField(
          controller: firstDate,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Required First Date ';
            }
            return null;
          },
        ),
      },
      {
        "label": "09/10/2021",
        "keyforbackend": "second_date_tax",
        "value": secondDate,
        "text_field": TextFormField(
          controller: secondDate,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Required Second Date ';
            }
            return null;
          },
        ),
      },
      {
        "label": "18/11/2021",
        "keyforbackend": "last_date_tax",
        "value": lastDate,
        "text_field": TextFormField(
          controller: lastDate,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Required last Date ';
            }
            return null;
          },
        ),
      }
    ];
  }

  List displayTextField = [];

  addTextField() {
    print("addTextField");

    setState(() {
      if (allTextField.length == displayTextField.length) {
        print("Same");
        return;
      } else {
        displayTextField.add(allTextField[displayTextField.length]);
      }
    });
  }

  removeTextField() {
    print("removeTextField");

    setState(() {
      if (displayTextField.isNotEmpty) {
        displayTextField.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dynamic Text Field"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                    label: Text("Enter Name"),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required Name  ';
                    }
                    return null;
                  },
                  // onChanged: (value) {
                  //   if (int.parse(value) > 1) {
                  //     setState(() {
                  //       if (allTextField.length == displayTextField.length) {
                  //         print("Same");
                  //         return;
                  //       } else {
                  //         displayTextField
                  //             .add(allTextField[displayTextField.length]);
                  //       }
                  //     });
                  //   }
                  // },
                  onEditingComplete: () {},
                  onFieldSubmitted: (value) {
                    if (int.parse(value) > 1) {
                      setState(() {
                        if (allTextField.length == displayTextField.length) {
                          print("Same");
                          return;
                        } else {
                          displayTextField
                              .add(allTextField[displayTextField.length]);
                        }
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Assesment Tax :'),
                    ElevatedButton(
                      onPressed: addTextField,
                      child: const Text('Add'),
                    ),
                    ElevatedButton(
                      onPressed: removeTextField,
                      child: const Text('Remove'),
                    ),
                  ],
                ),
                ...displayTextField
                    .map(
                      (e) => Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, right: 20),
                            child: Text(
                              e['label'],
                            ),
                          ),
                          Expanded(child: e['text_field'])
                        ],
                      ),
                    )
                    .toList(),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        List finalDynamicTextFieldValue = [];

                        if (displayTextField.isNotEmpty) {
                          for (int i = 0; i < displayTextField.length; i++) {
                            TextEditingController taxValue =
                                displayTextField[i]['value'];

                            Map dummyMap = {
                              "${displayTextField[i]['keyforbackend']}":
                                  taxValue.text
                            };
                            print(dummyMap);
                            finalDynamicTextFieldValue.add(dummyMap);
                          }
                        }

                        Map requiredFormDataForBackend = {
                          'name': name.text,
                          "tax": finalDynamicTextFieldValue
                        };
                        print("Final Data $requiredFormDataForBackend");
                      }
                    },
                    child: const Text("Submit Data"))
              ],
            )),
      ),
    );
  }
}
