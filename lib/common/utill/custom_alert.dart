import 'package:flutter/material.dart';

void showCustomAlertDialog(
    {required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onConfirmed,
    bool? isSingleButton = false}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: const Text('취소'),
            onPressed: () {
              Navigator.of(context).pop(); // Dismiss the dialog
            },
          ),
          if (isSingleButton == true)
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                onConfirmed(); // Execute the callback function
              },
            ),
        ],
      );
    },
  );
}
