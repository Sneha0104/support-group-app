import 'package:flutter/material.dart';
import 'package:hackverse/login.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hackverse/meetupCreation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HttpLink link = HttpLink(
      uri: "https://supportgrp.herokuapp.com/v1/graphql",
    );
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(cache: InMemoryCache(), link: link),
    );
    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Support Squad',
          //test phase
          home: Login(),
          routes: {
            '/login': (context) => Login(),
          },
        ),
      ),
    );
  }
}
