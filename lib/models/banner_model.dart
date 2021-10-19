class BannerModel {
  int? status;
  String? message;
  List<BannerData>? data;

  BannerModel({this.status, this.message, this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BannerData>[];
      json['data'].forEach((v) {
        data!.add(new BannerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerData {
  int? id;
  String? title;
  String? link;
  int? sort;
  String? image;
  Null createdAt;
  Null updatedAt;
  int? status;

  BannerData(
      {this.id,
        this.title,
        this.link,
        this.sort,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.status});

  BannerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    link = json['link'];
    sort = json['sort'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['link'] = this.link;
    data['sort'] = this.sort;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    return data;
  }
}

























// class BannerModel {
//   int? id;
//   String? title;
//   String? link;
//   int? sort;
//   String? image;
//
//   BannerModel({
//       this.id,
//       this.title,
//       this.link,
//       this.sort,
//       this.image});
//
//   BannerModel.fromJson(dynamic json) {
//     id = json["id"];
//     title = json["title"];
//     link = json["link"];
//     sort = json["sort"];
//     image = json["image"];
//   }
//
//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     map["id"] = id;
//     map["title"] = title;
//     map["link"] = link;
//     map["sort"] = sort;
//     map["image"] = image;
//     return map;
//   }
//
// }