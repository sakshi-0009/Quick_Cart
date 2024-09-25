import 'comment_model.dart';

class ProductModel {
  String? name;
  int? id;
  String? image;
  int? price;
  String? description;
  List<CommentModel>? comments = [];

  ProductModel(
      {this.name,
        this.id,
        this.image,
        this.description,
        this.comments,
        this.price});

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    comments = json['comments'] != null
        ? (json['comments'] as List)
        .map((i) => CommentModel.fromJson(i))
        .toList()
        : [];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    if (this.image != null) {
      data['image'] = this.image;
    }
    if (this.price != null) {
      data['price'] = this.price;
    }
    if (this.description != null) {
      data['description'] = this.description;
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  ProductModel addComment({required CommentModel comments}) {
    final currentComments = this.comments ?? [];
    final newComments = [...currentComments, comments];
    return ProductModel(
      name: name ?? this.name,
      id: id ?? this.id,
      image: image ?? this.image,
      price: price ?? this.price,
      description: description ?? this.description,
      comments: newComments,
    );
  }

  ProductModel copyWith({
    String? name,
    int? id,
    String? uid,
    String? image,
    int? price,
    String? description,
    List<CommentModel>? comments,
  }) {
    return ProductModel(
      name: name ?? this.name,
      id: id ?? this.id,
      image: this.image,
      price: price ?? this.price,
      description: this.description,
      comments: comments ?? this.comments,
    );
  }

  // For update

  void setPrice(int _value) => price = _value;

  void setName(String val) => name = val;

  void setDescription(String val) => description = val;

  void setImage(String urlImage) => image = urlImage;
}
