import 'package:flutter/material.dart';

class Dialogs {
  information(BuildContext context, String title, String description) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: [Text(description)],
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              )
            ],
          );
        });
  }

  waiting(BuildContext context, String title, String description) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: [Text(description)],
              ),
            ),
          );
        });
  }

  _confirmResult(bool isYes, BuildContext context) {
    if (isYes == true) {
      print('yes action');
      Navigator.pop(context);
    } else {
      print('Cancel action');
      Navigator.pop(context);
    }
  }

  confirm(BuildContext context, String title, String description) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: [Text(description)],
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () => _confirmResult(false, context),
                child: Text("Cancel"),
              ),
              FlatButton(
                onPressed: () => _confirmResult(true, context),
                child: Text("Yes"),
              )
            ],
          );
        });
  }
}
