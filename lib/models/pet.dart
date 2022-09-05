import 'dart:convert';

import 'package:my_app/models/category.dart';
import 'package:my_app/models/tag.dart';

class Pet {
  String? name;
  List<String>? photoUrls;
  int? id;
  Category? category;
  List<Tag>? tags;
  Status? status;

  Pet({
    this.name,
    this.photoUrls,
    required this.id,
    this.category,
    this.tags,
    this.status,
  });

  Pet.fromJson(String json) {
    Map<String, dynamic> _json = jsonDecode(json);
    name = _json['name'];
    photoUrls = _json['photoUrls'].cast<String>();
    id = _json['id'];
    category =
        _json['category'] != null ? Category.fromJson(_json['category']) : null;
    if (_json['tags'] != null) {
      tags = <Tag>[];
      _json['tags'].forEach((v) {
        tags!.add(Tag.fromJson(v));
      });
    }
    status = stringToStatus(_json['status']);
  }

  String toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['photoUrls'] = this.photoUrls;
    data['id'] = this.id.toString();
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['tags'] = Tag().encodeTags(this.tags);
    data['status'] = statusToString(this.status ?? Status.unavailable);
    return jsonEncode(data);
  }

  Status stringToStatus(String status) {
    if (status == "available") {
      return Status.available;
    } else {
      return Status.unavailable;
    }
  }

  String statusToString(Status status) {
    if (status == Status.available) {
      return "available";
    } else {
      return "unavailable";
    }
  }
}

enum Status { available, unavailable }
