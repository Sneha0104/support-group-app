import 'package:flutter/material.dart';

class UserWarning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WARNING'),
        ),
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'All users must under any  circumstance refrain from sharing your personal information such as name, phone number , address or other contact details to anyone via the app . Always refer to oneself by the username provided.  Sharing of information during or post ‘Meet Ups’ is optional and is advised to be under the supervision of the ‘moderator’. The above said rule is to ensure a good experience and more importantly the safety of the user. Hence users are expected to strictly stick by the said rules .',
                    style: TextStyle(fontSize: 23.0),
                  ),
                  RaisedButton(
                    child: Text(
                      'I Agree',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    onPressed: () {}, //Navigate to home
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(80.0)),
                  )
                ])));
  }
}
