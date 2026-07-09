import 'package:flutter/material.dart';

class FeaturedResturantModel {
  String name;
  String imagePath;

  FeaturedResturantModel({required this.name, required this.imagePath});

  static List<FeaturedResturantModel> getFeaturedRestaurant() {
    List<FeaturedResturantModel> featuredRestuarant = [];

    featuredRestuarant.add(
      FeaturedResturantModel(
        name: 'Terra',
        imagePath: 'assets/images/terra.png',
      ),
    );

    featuredRestuarant.add(
      FeaturedResturantModel(
        name: 'McDonald',
        imagePath: 'assets/images/McDonald.png',
      ),
    );

    featuredRestuarant.add(
      FeaturedResturantModel(name: 'KFC', imagePath: 'assets/images/kfc.png'),
    );

    featuredRestuarant.add(
      FeaturedResturantModel(
        name: 'Yakoyo',
        imagePath: 'assets/images/yakoyo.png',
      ),
    );

    featuredRestuarant.add(
      FeaturedResturantModel(
        name: 'Dominos',
        imagePath: 'assets/images/dominos.png',
      ),
    );

    featuredRestuarant.add(
      FeaturedResturantModel(
        name: 'Chillox',
        imagePath: 'assets/images/chillox.png',
      ),
    );

    return featuredRestuarant;
  }
}
