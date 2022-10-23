class ProductsModel {
  int? status;
  String? message;
  List<Products>? products;

  ProductsModel({this.status, this.message, this.products});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }
}

class Products {
  final int id;
  final String company;
  final String name;
  final String type;
  final String price;
  final String image;
  final String description;

  const Products(
      {required this.id,
      required this.company,
      required this.name,
      required this.type,
      required this.price,
      required this.image,
      required this.description});

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json['id'],
        company: json['company'],
        name: json['name'],
        type: json['type'],
        price: json['price'],
        image: json['image'],
        description: json['description'],
      );
}
