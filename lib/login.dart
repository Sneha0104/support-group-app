import 'package:flutter/material.dart';
import 'package:hackverse/home.dart';
import 'package:hackverse/usersignup.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Container(
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'LOGIN',
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Email Address")),
              TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password")),
              RaisedButton(
                  child: Column(
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.only(top: 5)),
                      Text("LOGIN"),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(80.0)),
                  onPressed: () {}),
              RaisedButton(
                  child: Column(
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.only(top: 5)),
                      Text("SIGN UP"),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(80.0)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserSignUp()),
                    );
                  }),
            ],
          )),
    );
  }
}
