class Product {
  String? category;
  String? collectionId;
  String? description;
  String? id;
  String? name;
  String? thumbnail;
  int? price;
  int? discountprice;
  int? quantity;

  Product(
    this.id,
    this.collectionId,
    this.thumbnail,
    this.description,
    this.discountprice,
    this.price,
    this.name,
    this.quantity,
    this.category,
  );

  factory Product.fromJson(Map<String, dynamic> jsonObject) {
    return Product(
      jsonObject['id'],
      jsonObject['collectionId'],
      jsonObject['thumbnail'],
      jsonObject['description'],
      jsonObject['discountprice'],
      jsonObject['price'],
      jsonObject['name'],
      jsonObject['quantity'],
      jsonObject['category'],
    );
  }
}
