import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class PlaceItem extends StatelessWidget {
  final String id;
  final String title;
  File imageUrl;

  //
  PlaceItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GridTile(
        child: GestureDetector(
            onTap: () {},
            child: Hero(
              tag: id,
              child: FadeInImage(
                placeholder:
                    AssetImage('assets/images/product-placeholder.png'),
                image: FileImage(imageUrl),
                fit: BoxFit.cover,
              ),
            )),
        footer: Container(
          color: kPrimaryColor,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style:Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
