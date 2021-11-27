// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_iam_i/Provider/great_places.dart';
import 'package:where_iam_i/models/place.dart';
import 'package:where_iam_i/widgets/image_input.dart';
import 'package:where_iam_i/widgets/location_input.dart';

class AddPlacesScreen extends StatefulWidget {
  static const id = 'add-place';
  const AddPlacesScreen({Key? key}) : super(key: key);

  @override
  _AddPlacesScreenState createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  final TextEditingController _titleController = TextEditingController();
  File? _pickedImage;
  PlaceLocation? _pickedLocation;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _selectPlace(double lat, double lng) {
    _pickedLocation = PlaceLocation(latitude: lat, longitute: lng);
    // PlaceLocation(lat, lng);
  }

  void _savePlace() {
    if (_titleController.text.isEmpty ||
        _pickedImage == null ||
        _pickedLocation == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage!, _pickedLocation!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        label: Text('Title'),
                      ),
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInputScreen(_selectImage),
                    SizedBox(
                      height: 10,
                    ),
                    LocationInput(_selectPlace),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: _savePlace,
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                backgroundColor:
                    MaterialStateProperty.all(Colors.amber.shade700),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(20),
                )),
            icon: const Icon(Icons.add),
            label: const Text("Add Place"),
          ),
        ],
      ),
    );
  }
}
