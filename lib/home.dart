import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hackverse/queries.dart' as queries;
import 'dart:io';

import 'package:graphql_flutter/graphql_flutter.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.people)),
                Tab(icon: Icon(Icons.book)),
                Tab(icon: Icon(Icons.contact_phone)),
              ],
            ),
            title: Text('Home'),
          ),
          body: TabBarView(
            children: [
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
                                        'modjj',
                                        style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          12.0, 6.0, 12.0, 12.0),
                                      child: Text(
                                        meetup['location'],
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
                                        meetup['date'].toString(),
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.add,
                                          size: 35.0,
                                          color: Colors.grey,
                                        ),
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
                                  "book/movie",
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    12.0, 6.0, 12.0, 12.0),
                                child: Text(
                                  "description",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.star,
                                    size: 35.0,
                                    color: Colors.grey,
                                  ),
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
                itemCount: 10,
              ),
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
                                  "psychologist",
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    12.0, 6.0, 12.0, 12.0),
                                child: Text(
                                  "contact",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    12.0, 6.0, 12.0, 12.0),
                                child: Text(
                                  "email",
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.person,
                                    size: 35.0,
                                    color: Colors.grey,
                                  ),
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
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
