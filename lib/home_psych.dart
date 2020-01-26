import 'dart:ffi';
import 'package:hackverse/meetupCreation.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:hackverse/queries.dart' as queries;
import 'dart:io';

import 'package:graphql_flutter/graphql_flutter.dart';

class Home_Psych extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home_Psych> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pinkAccent,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.portrait)),
                Tab(icon: Icon(Icons.person)),
                Tab(icon: Icon(Icons.add_box)),
              ],
            ),
            title: Text('Home'),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemBuilder: (context, position) {
                  return Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    12.0, 12.0, 12.0, 6.0),
                                child: Text(
                                  "Name:",
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    12.0, 6.0, 12.0, 12.0),
                                child: Text(
                                  "Age:",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    12.0, 6.0, 12.0, 12.0),
                                child: Text(
                                  "Contact:",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    12.0, 6.0, 12.0, 12.0),
                                child: Text(
                                  "Email:",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    12.0, 6.0, 12.0, 12.0),
                                child: Text(
                                  "Location:",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        height: 2.0,
                        color: Colors.grey,
                      )
                    ],
                  );
                },
                itemCount: 1,
              ),
              Query(
                options: QueryOptions(
                    document: queries.readMeetups, pollInterval: 4),
                builder: (QueryResult res,
                    {VoidCallback refetch, FetchMore fetchMore}) {
                  if (res.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final List<dynamic> meetups = res.data['meetups'];
                  return ListView.builder(
                      itemBuilder: (context, position) {
                        final Map<String, dynamic> meetup = meetups[position];
                        return Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          12.0, 12.0, 12.0, 6.0),
                                      child: Text(
                                        meetup['location'],
                                        style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          12.0, 6.0, 12.0, 12.0),
                                      child: Text(
                                        meetup['addr'],
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(
                                        new DateFormat.yMMMd().format(
                                            DateTime.parse(meetup['time'])),
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        new DateFormat.jm().format(
                                            DateTime.parse(meetup['time'])),
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 2.0,
                              color: Colors.grey,
                            )
                          ],
                        );
                      },
                      itemCount: meetups.length);
                },
              ),
              MeetUpCreate(),
            ],
          ),
        ),
      ),
    );
  }
}
