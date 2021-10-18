class CategoryModel {
  int? id;
  String? name;
  String? image;

  CategoryModel({
      this.id, 
      this.name, 
      this.image});

  CategoryModel.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["image"] = image;
    return map;
  }

}