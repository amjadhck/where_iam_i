import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_iam_i/Provider/great_places.dart';

import 'add_place_screen.dart';

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
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlacesScreen.id);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false)
              .fethAndSetPlaces(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<GreatPlaces>(
                  // child: const Center(
                  //   child: Text("No places yet.."),
                  // ),
                  builder: (ctx, greatPlaces, child) =>
                      greatPlaces.items.isEmpty
                          ? const Center(child: Text("No Places yet.."))
                          : ListView.builder(
                              itemCount: greatPlaces.items.length,
                              itemBuilder: (ctx, index) => ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      FileImage(greatPlaces.items[index].image),
                                ),
                                title: Text(greatPlaces.items[index].title),
                                subtitle: Text(
                                    greatPlaces.items[index].location!.address),
                                onTap: () {},
                              ),
                            ),
                ),
        ));
  }
}
