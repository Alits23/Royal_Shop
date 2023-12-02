abstract class ProductEvent {}

class ProductRequestData extends ProductEvent {
  String productId;
  ProductRequestData(this.productId);
}
