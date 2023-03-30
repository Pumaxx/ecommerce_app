import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Model/models/prouct_model.dart';
import 'package:ecommerce_app/Model/repositories/products/base_products_repository.dart';

class ProductRepository extends BaseProductRepository {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromShnapshot(doc)).toList();
    });
  }
}
