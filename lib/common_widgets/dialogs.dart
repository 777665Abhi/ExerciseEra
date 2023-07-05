import 'package:flutter/material.dart';


class DialogUtils {
static DialogUtils _instance = new DialogUtils.internal();

DialogUtils.internal();

factory DialogUtils() => _instance;

static void showCustomDialog(BuildContext context,
{ title,
  widget,
    String okBtnText = "Ok",
String cancelBtnText = "Cancel",
 okBtnFunction}) {
showDialog(
context: context,
builder: (_) {
return AlertDialog(
title: widget??Text(title??""),

actions: <Widget>[
ElevatedButton(
child: Text(okBtnText),
onPressed: okBtnFunction??(){},
),
ElevatedButton(
child: Text(cancelBtnText),
onPressed: () => Navigator.pop(context))
],
);
});
}
}