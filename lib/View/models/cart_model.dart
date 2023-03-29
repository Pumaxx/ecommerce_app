import 'package:ecommerce_app/View/models/prouct_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  const Cart({this.products = const <Product>[]});
  final double freeDeliveryTarget = 20.0;
  final List<Product> products;

  double get subtotal =>
      products.fold(0, (total, currentPrice) => total += currentPrice.price);

  double deliveryFee() {
    if (subtotal >= freeDeliveryTarget) {
      return 0.0;
    }
    return 10.0;
  }

  double total() {
    return subtotal + deliveryFee();
  }

  String freeDelivery() {
    if (subtotal >= freeDeliveryTarget) {
      return 'You have Free Delivery';
    }

    double missingValue = freeDeliveryTarget - subtotal;
    String missingValueString = missingValue.toStringAsFixed(2);
    return 'Add \$$missingValueString for Free Delivery';
  }

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee().toStringAsFixed(2);
  String get totalString => total().toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}
