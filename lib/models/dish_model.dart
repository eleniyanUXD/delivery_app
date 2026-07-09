class DishModel {
  final String id;
  final String name;
  final String imagePath;
  final int price;
  bool isFavorite;

  DishModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    this.isFavorite = false,
  });

  static List<DishModel> getDishes() {
    return [
      DishModel(
        id: '1',
        name: 'Pizza',
        imagePath: 'assets/images/pizza.png',
        price: 2500,
      ),
      DishModel(
        id: '2',
        name: 'Shawarma',
        imagePath: 'assets/images/shawarma.png',
        price: 1500,
      ),
      DishModel(
        id: '3',
        name: 'MoiMoi',
        imagePath: 'assets/images/moimoi.png',
        price: 2000,
      ),
      DishModel(
        id: '4',
        name: 'Pasta',
        imagePath: 'assets/images/pasta.png',
        price: 1000,
      ),
      DishModel(
        id: '5',
        name: 'Chicken Salad',
        imagePath: 'assets/images/chickensalad.png',
        price: 1000,
      ),
      DishModel(
        id: '6',
        name: 'Vegetable',
        imagePath: 'assets/images/vegetable.png',
        price: 1000,
      ),
      DishModel(
        id: '7',
        name: 'Spicy Noodles',
        imagePath: 'assets/images/spicynoodles.png',
        price: 1000,
      ),
      DishModel(
        id: '8',
        name: 'Seafood Okro',
        imagePath: 'assets/images/seafoodokro.png',
        price: 1000,
      ),
    ];
  }
}
