import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/Model/models/prouct_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../Model/models/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_onCartStarted);
    on<CartProductAdd>(_onCartProductAdded);
    on<CartProductRemove>(_onCartProductRemoved);
  }

  void _onCartStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const CartLoaded());
    } catch (_) {
      emit(CartError());
    }
  }

  void _onCartProductAdded(CartProductAdd event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
          cart: Cart(
            products: List.from(state.cart.products)..add(event.product),
          ),
        ));
      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _onCartProductRemoved(CartProductRemove event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(
          cart: Cart(
            products: List.from(state.cart.products)..remove(event.product),
          ),
        ));
      } catch (_) {
        emit(CartError());
      }
    }
  }
}
