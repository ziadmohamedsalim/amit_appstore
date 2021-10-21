import 'package:equatable/equatable.dart';
import 'package:final_project/models/products.dart';

abstract class CartState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

// ignore: must_be_immutable
class InitialState extends CartState {}

// ignore: must_be_immutable
class LoadedState extends CartState {
  List<Product> shoppingCart;
  LoadedState({required this.shoppingCart});
}

class LoadingState extends CartState {}

// ignore: must_be_immutable
class FailedToLoadState extends CartState {
  String error;
  FailedToLoadState({required this.error});
}