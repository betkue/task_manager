import 'package:flutter/material.dart';
import 'package:task_manager/src/styles/styles.dart';

class TextInput extends StatefulWidget {
  final Function(String? value)? onsave;
  final Function(String?) validator;
  final String label;
  final int maxLines;
  final String? text;
  const TextInput(
      {super.key,
      required this.onsave,
      required this.validator,
      required this.label,
      this.text,
      this.maxLines = 1});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        cursorColor: blackColor,
        maxLines: widget.maxLines,
        keyboardType: TextInputType.text,
        controller: TextEditingController(text: widget.text),
        style: TextStyle(
          color: blackColor,
          fontSize: height / 55,
          fontWeight: FontWeight.w500,
        ),
        decoration: textInputDecoration(context).copyWith(
          hintText: widget.label,
          contentPadding: const EdgeInsets.only(left: 15),
          hintStyle: TextStyle(
            color: !(Theme.of(context).brightness == Brightness.dark)
                ? gray2Color
                : grayColor,
            fontSize: height / 55,
            fontWeight: FontWeight.w500,
          ),
        ),
        onSaved: (String? value) {
          widget.onsave!(value);
        },
        validator: (String? value) {
          widget.validator(value);
        },
      ),
    );
  }
}

InputDecoration textInputDecoration(context) {
  return InputDecoration(
    fillColor: Theme.of(context).brightness == Brightness.dark
        ? gray2Color
        : grayColor,
    filled: true,
    contentPadding: EdgeInsets.only(bottom: 9, left: 5, right: 5),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: gray2Color, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: gray2Color, width: 0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: gray2Color, width: 0),
    ),
  );
}
