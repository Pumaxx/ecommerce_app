import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Model/models/prouct_model.dart';
import 'package:ecommerce_app/Model/repositories/products/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository _productsRepository;
  StreamSubscription? _productsSubscription;

  ProductsBloc({required ProductRepository productsRepository})
      : _productsRepository = productsRepository,
        super(ProductsLoading()) {
    on<LoadProducts>(_onLoadProducts);
    on<UpdateProducts>(_onUpdateProducts);
  }

  void _onLoadProducts(LoadProducts event, Emitter<ProductsState> emit) {
    _productsSubscription?.cancel();
    _productsSubscription = _productsRepository.getAllProducts().listen(
          (products) => add(
            UpdateProducts(products),
          ),
        );
  }

  void _onUpdateProducts(UpdateProducts event, Emitter<ProductsState> emit) {
    emit(ProductsLoaded(products: event.products));
  }
}
