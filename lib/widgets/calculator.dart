import 'package:flutter/material.dart';

Widget listBox(int? checkboxCount) {
  if (checkboxCount != null) {
    int i = 0;
    do {
      // do somethings at least once
      i++;
    } while (i <= checkboxCount);

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
    return Text("data");
  }
}
