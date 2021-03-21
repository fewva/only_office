import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String labelText;
  final TextEditingController textEditingController;

  const CustomTextField({
    Key key,
    this.labelText,
    this.textEditingController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: 'Input Text'
        ),
      ),
    );
  }
}