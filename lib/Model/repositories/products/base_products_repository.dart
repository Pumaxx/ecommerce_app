import 'package:ecommerce_app/Model/models/prouct_model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
