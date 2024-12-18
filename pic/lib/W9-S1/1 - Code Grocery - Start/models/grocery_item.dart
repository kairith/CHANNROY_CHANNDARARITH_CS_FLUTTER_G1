import 'grocery_category.dart';
enum Mode  { normal, selection }

enum GroceryType {
  label,
  color;
}

class GroceryItem {
  const GroceryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

  final String id;
  final String name;
  final int quantity;
  final GroceryCategory category;
}
