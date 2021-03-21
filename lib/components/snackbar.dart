import 'package:flutter/material.dart';

SnackBar snackBar(String errorMessage) {
  return SnackBar(
    backgroundColor: Colors.white,
    elevation: 10,
    content: Text(errorMessage, style: TextStyle(color: Colors.black)),
    action: SnackBarAction(
      label: 'ok',
      textColor: Colors.redAccent,
      onPressed: () {
        print('Error');
      },
    ),
  );
}