class ProductModel {
  final int? id;
  final String? title;
  final String? description;
  final double? price;
  final String? image;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num?)?.toDouble(),
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'price': price,
      'image': image,
    };
  }
}
