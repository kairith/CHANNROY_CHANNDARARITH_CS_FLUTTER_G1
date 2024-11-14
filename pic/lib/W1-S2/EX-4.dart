void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example order
  const order = ['margherita', 'pepperoni', 'pineapple'];
  // Your code
  double total = 0.0;
  for (var pizza in order) {
    if (pizzaPrices.containsKey(pizza)) {
      total += pizzaPrices[pizza]!;
    } else {
      // if the order doesn't contain with the pizza price 
      print('$pizza is not on the menu');
    }
  }
  if (total > 0) {
    print('Total: \$${total}');
  }
}
