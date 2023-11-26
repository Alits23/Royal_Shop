class Varinat {
  String? id;
  String? name;
  String? typeId;
  String? value;
  int? priceChange;

  Varinat(
    this.id,
    this.name,
    this.typeId,
    this.value,
    this.priceChange,
  );

  factory Varinat.fromJson(Map<String, dynamic> jsonObject) {
    return Varinat(
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['type_id'],
      jsonObject['value'],
      jsonObject['price_change'],
    );
  }
}
