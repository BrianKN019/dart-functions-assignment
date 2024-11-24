import 'dart:math';

// Function to calculate total price with optional tax parameter
double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
  double subtotal = prices.fold(0.0, (total, price) => total + price);
  return subtotal + (subtotal * taxRate);
}

// Higher-order function to apply discounts
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map(discountFunction).toList();
}

// Recursive function to calculate factorial discount
int calculateFactorialDiscount(int n) {
  if (n <= 1) return 1;
  return n * calculateFactorialDiscount(n - 1);
}

void main() {
  // Sample cart with item prices
  List<double> cart = [15.0, 25.0, 5.0, 50.0, 8.0];

  // Anonymous function to filter out items below a threshold
  double threshold = 10.0;
  List<double> filteredCart = cart.where((price) => price >= threshold).toList();
  print("Filtered Cart (items above \$$threshold): $filteredCart");

  // Apply a 10% discount using a higher-order function
  double discountPercentage = 10.0;
  List<double> discountedCart = applyDiscount(
    filteredCart,
    (price) => price * (1 - discountPercentage / 100),
  );
  print("Cart after $discountPercentage% discount: $discountedCart");

  // Calculate the total with tax (e.g., 8%)
  double taxRate = 0.08;
  double subtotal = calculateTotal(discountedCart, taxRate: taxRate);
  print("Total after tax (\$taxRate%): \$${subtotal.toStringAsFixed(2)}");

  // Calculate factorial discount and apply it
  int itemCount = discountedCart.length;
  int factorialDiscount = calculateFactorialDiscount(itemCount);
  print("Factorial Discount: $factorialDiscount%");

  // Apply the factorial discount to the subtotal
  double finalTotal = subtotal * (1 - factorialDiscount / 100);
  print("Final Price after Factorial Discount: \$${finalTotal.toStringAsFixed(2)}");
}
