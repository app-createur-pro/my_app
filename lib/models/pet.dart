import 'package:my_app/models/category.dart';
import 'package:my_app/models/tag.dart';

class Pet {
  int? id;
  Category? category;
  String? name;
  List<String>? photoUrls;
  List<Tag>? tags;
  String? status;

  Pet({
    required this.id,
    this.category,
    this.name,
    this.photoUrls,
    this.tags,
    this.status,
  });

  Pet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    name = json['name'];
    photoUrls = json['photoUrls'].cast<String>();
    if (json['tags'] != null) {
      tags = <Tag>[];
      json['tags'].forEach((v) {
        tags!.add(new Tag.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['name'] = this.name;
    data['photoUrls'] = this.photoUrls;
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}
