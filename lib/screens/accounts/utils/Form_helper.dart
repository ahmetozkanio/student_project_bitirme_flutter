import 'package:flutter/material.dart';

class FormHelper {
  static Widget inputFieldWidget(
    BuildContext context,
    Icon icon,
    String keyName,
    String labelName,
    Function onValidate,
    Function onSaved, {
    String initialValue = "",
    obscureText: false,
    Widget? suffixIcon,
  }) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        initialValue: initialValue,
        key: new Key(keyName),
        obscureText: obscureText,
        validator: (newValue) => onValidate(newValue),
        onSaved: (newValue) => onSaved(newValue),
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          hintText: labelName,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).primaryColor),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }

  static Widget saveButton(String buttonText, Function onTap) {
    return Container(
      height: 50,
      width: 150,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            color: Colors.amber,
            borderRadius: BorderRadius.circular(
              30.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Future<void> showMessage(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // static Future<void> showMessage(
  //   BuildContext context,
  //   String title,
  //   String message,
  //   String buttonText,
  //   Function onPressed,
  // ) async {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text(title),
  //           content: Text(message),
  //           actions: [
  //             TextButton(
  //               onPressed: () => onPressed(),
  //               child: Text(
  //                 buttonText,
  //               ),
  //             ),
  //           ],
  //         );
  //       });
  // }
}
