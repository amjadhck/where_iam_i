import 'package:flutter/material.dart';

class PlacesListScreen extends StatelessWidget {
  static const id = '/place-list-screen';
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Places'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ));
  }
}
