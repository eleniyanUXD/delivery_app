import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String imagePath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.imagePath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Shawarma',
        imagePath: 'assets/images/shawarma.png',
        boxColor: Color(0xff92A3FD),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Pizza',
        imagePath: 'assets/images/pizza.png',
        boxColor: Color(0xffFF9F43),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Rice',
        imagePath: 'assets/images/jollofrice.png',
        boxColor: Color(0xffF2C94C),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Drinks',
        imagePath: 'assets/images/drink.png',
        boxColor: Color(0xff56CCF2),
      ),
    );

    return categories;
  }
}
