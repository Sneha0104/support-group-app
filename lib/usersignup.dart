import 'package:flutter/material.dart';
import 'package:hackverse/userwarning.dart';

TextEditingController name1 = new TextEditingController();
TextEditingController name2 = new TextEditingController();
TextEditingController name3 = new TextEditingController();
TextEditingController email = new TextEditingController();
TextEditingController password = new TextEditingController();

class UserSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Sign Up"),
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'SIGN UP',
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                    controller: name1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "First Name")),
                TextFormField(
                    controller: name2,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Middle Name")),
                TextFormField(
                    controller: name3,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Last Name ")),
                TextFormField(
//                    controller: phone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: "Phone Number ")),
                TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "Email Address ")),
                TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(labelText: "Password ")),
                RaisedButton(
                  child: Text("SIGN UP"),
                  onPressed: () {
                    validateStructure(password.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserWarning()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(80.0)),
                ),
              ],
            ),
          )),
    );
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
