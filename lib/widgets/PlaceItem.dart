import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:great_places_app/models/place.dart';
import '../colors.dart';

class PlaceItem extends StatelessWidget {
  final String id;
  final String title;
  final PlaceLocation pickedLocation;
  File imageUrl;

  //
  PlaceItem(this.id, this.title, this.imageUrl, this.pickedLocation);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: GridTile(
        child: GestureDetector(
            onTap: () {},
            child: Hero(
              tag: id,
              child: FadeInImage(
                placeholder: AssetImage('assets/images/NoImageFound.png'),
                image: FileImage(imageUrl),
                fit: BoxFit.cover,
              ),
            )),
        footer: Container(
          color: kPrimaryColor,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  pickedLocation.address,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
