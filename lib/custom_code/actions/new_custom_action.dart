// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future newCustomAction(BuildContext context) async {
  // change the icon fill color when the person clicks on it
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Custom Action"),
        content: Text("This is a custom action."),
        actions: <Widget>[
          TextButton(
            child: Text("CANCEL"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("OK"),
            onPressed: () {
              // Change the icon fill color here
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
