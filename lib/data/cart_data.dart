import 'cart_item.dart';

List<CartItem> cartItems = [];

void addToCart(CartItem item) {
  int index = cartItems.indexWhere((e) => e.id == item.id);

  if (index != -1) {
    final existing = cartItems[index];
    cartItems[index] = CartItem(
      id: existing.id,
      title: existing.title,
      subtitle: existing.subtitle,
      image: existing.image,
      price: existing.price,
      quantity: existing.quantity + item.quantity,
    );
  } else {
    cartItems.add(item);
  }
}
