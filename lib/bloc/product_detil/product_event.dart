abstract class ProductEvent {}

class ProductRequestData extends ProductEvent {
  String productId;
  String categoryId;
  ProductRequestData(this.productId, this.categoryId);
}
