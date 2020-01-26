import 'package:flutter/material.dart';

TextEditingController City = new TextEditingController();
TextEditingController Location = new TextEditingController();
TextEditingController Date = new TextEditingController();
TextEditingController Time = new TextEditingController();

class MeetUpCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.people),
          Text('           Create a Meetup'),
        ],
      )),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Enter Details of Meetup',
                style: TextStyle(fontSize: 35.0),
              ),
              TextFormField(
                  controller: City,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "City")),
              TextFormField(
                  controller: Location,
                  keyboardType: TextInputType.text,
                  decoration:
                      InputDecoration(labelText: "Address or Location")),
              TextFormField(
                  controller: Date,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(labelText: "Date (DD/MM/YY)")),
              TextFormField(
                  controller: Time,
                  keyboardType: TextInputType.datetime,
                  decoration:
                      InputDecoration(labelText: "Time (24 Hour Format)")),
              RaisedButton(
                  child: Text(
                    'Fix Meetup',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    if (City.text == "")
                      //_showDialog();
                      Text("sdf");
                    else if (Location.text == "")
                      Text("Enter all neccessary details.");
                    else if (Date.text == "")
                      Text("Enter all neccessary details.");
                    else if (Time.text == "")
                      Text("Enter all neccessary details.");
                    else
                      ;
                  },
                  //Meet up fix
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0)),
                  textColor: Colors.white,
                  color: Colors.blue)
            ],
          ),
        ),
      ),
    );
  }
}
//   void _showDialog() {
//     // flutter defined function
//     showDialog(
//       contex,
//       builder: (BuildContext context) {
//         // return object of type Dialog
//         return AlertDialog(
//           title: new Text("Not so fast..."),
//           content: new Text("You gotta fill all the fields."),
//           actions: <Widget>[
//             // usually buttons at the bottom of the dialog
// //          new FlatButton(
// //            child: new Text("Close"),
// //            onPressed: () {
// //              Navigator.of(context).pop();
// //            },
// //          ),
//           ],
//         );
//       },
//     );
//   }
// }
