import 'package:flutter/material.dart';

SizedBox hSpacer(double vWidth) {
  return SizedBox(width: vWidth);
}

SizedBox vSpacer(double vHeight) {
  return SizedBox(width: vHeight);
}

Widget inputBox(String text, double width) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Text(text),
      hSpacer(15),
      SizedBox(
        height: width / 12,
        width: width / 12,
        child: TextFormField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 5.0),
              ),
              fillColor: Colors.grey,
              focusColor: Colors.grey),
        ),
      ),
      hSpacer(10),
    ]),
  );
}
