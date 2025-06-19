// class ProductModel {
//   final String? id;
//   final String? title;
//   final String? description;
//   final double? price;
//   final String? imageUrl;
//   final String? category;
//
//   ProductModel({
//      this.id,
//      this.title,
//       this.description,
//      this.price,
//      this.imageUrl,
//      this.category,
//   });
//
//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       id: json['id'] as String?,
//       title: json['title'],
//       description: json['description'],
//       price: json['price'],
//       imageUrl: json['imageUrl'],
//       category: json['category'],
//     );
//   }
// }


class ProductModel {
  final int? id;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  final String? category;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num?)?.toDouble(),
      imageUrl: json['image'], // اسم الحقل الصحيح
      category: json['category'],
    );
  }
}
