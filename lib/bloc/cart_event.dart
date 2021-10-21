import 'package:equatable/equatable.dart';
import 'package:final_project/models/products.dart';

class CartEvents extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [  ];
}

// ignore: must_be_immutable
class AddProductEvent extends CartEvents {
  Product newProduct;
  AddProductEvent({required this.newProduct});
}

// ignore: must_be_immutable
class DeleteProductEvent extends CartEvents {
  Product newProduct;
  DeleteProductEvent({required this.newProduct});
}

// ignore: must_be_immutable
class IncrementProductCountEvent extends CartEvents {
  int productIndex;
  IncrementProductCountEvent({required this.productIndex});
}

// ignore: must_be_immutable
class DecrementProductCountEvent extends CartEvents {
  int productIndex;
  DecrementProductCountEvent({required this.productIndex});
}

class ClearCartEvent extends CartEvents {}