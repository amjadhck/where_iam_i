// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:where_iam_i/screens/place_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Where Iam I',
      theme: ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.amber),
      home: PlacesListScreen(),
      routes: {
        PlacesListScreen.id: (context) => PlacesListScreen(),
      },
    );
  }
}
