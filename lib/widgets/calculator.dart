import 'package:flutter/material.dart';

List<Widget> listBox(int? checkboxCount) {
  List<Widget> checkbox = [];
  if (checkboxCount != null) {
    int i = 0;
    do {
      checkbox.add(Text("hellow"));
      i++;
    } while (i <= checkboxCount);
    return checkbox;
    // for (int i = 0; i <= 5; i++) {
    //   return Text("hellow");
    //   //   return CheckboxListTile(
    //   //   controlAffinity: ListTileControlAffinity.leading,
    //   //   title:  Text(i.toString()),
    //   //   value: showValue,
    //   //   onChanged: (bool? value) {
    //   //     setState(() {
    //   //       showValue = value!;
    //   //     });
    //   //   },
    //   // );
    // }
  } else {
    checkbox.add(Text("a"));
    return checkbox;
  }
}
