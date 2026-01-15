class CategoryData {
  int? id; // Changed to int
  String? name;
  String? image;
  String? description;
  int? price; // Changed to double

  CategoryData({
    this.id,
    this.name,
    this.image,
    this.description,
    this.price
  });

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json["id"].toString()) ?? 0; // Convert to int
    name = json["name"];
    image = json["image"];
    description = json["description"];
    price = int.tryParse(json["price"].toString()) ?? 0; // Convert to double
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["image"] = image;
    map["description"] = description;
    map["price"] = price;
    return map;
  }
}
