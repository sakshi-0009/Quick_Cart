class CategoryModel {
  String? name;
  int? id;
  List<int>? productIds;
  String? image;

  CategoryModel({this.name, this.id, this.productIds, this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    image = json['image'];
    productIds =
    json['productIds'] != null ? json['productIds'].cast<int>() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['image'] = this.image;
    data['productIds'] = this.productIds;
    return data;
  }

  CategoryModel copyWith(
      {String? name, int? id, List<int>? productIds, String? image}) {
    return CategoryModel(
      name: name ?? this.name,
      id: id ?? this.id,
      productIds: productIds ?? this.productIds,
      image: image ?? this.image,
    );
  }
}
