import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_iam_i/Provider/great_places.dart';
import 'package:where_iam_i/helpers/init.dart';
import 'package:where_iam_i/screens/add_place_screen.dart';
import 'package:where_iam_i/screens/place_detail_screen.dart';
import 'package:where_iam_i/screens/place_list_screen.dart';

import 'screens/splash_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(home: Splash());
        } else {
          return ChangeNotifierProvider(
            create: (context) => GreatPlaces(),
            child: MaterialApp(
              title: 'Where Iam I',
              theme: ThemeData(
                primarySwatch: Colors.indigo,
              ),
              home: const PlacesListScreen(),
              routes: {
                PlacesListScreen.id: (context) => const PlacesListScreen(),
                AddPlacesScreen.id: (context) => const AddPlacesScreen(),
                PlaceDetailScreen.id: (context) => const PlaceDetailScreen(),
              },
            ),
          );
        }
      },
    );
  }
}
