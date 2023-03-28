import 'package:flutter/material.dart';

Widget optionBox(
    {required String optIndex,
    required String option,
    required bool isSelected}) {
  return Builder(builder: (context) {
    Size s = MediaQuery.of(context).size;

    return Container(
      height: s.height * 0.08,
      width: s.width * 0.4,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
        border: (isSelected) ? Border.all() : null,
      ),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      child: Text("$optIndex) $option"),
    );
  });
}
