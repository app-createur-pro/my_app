class Tag {
  int? id;
  String? name;

  Tag({this.id, this.name});

  Tag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson(tag) {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = tag.id;
    data['name'] = tag.handleAPIResponse;
    return data;
  }

  //encode a List of objects to String for shared pref
  List<dynamic> encodeTags(List<Tag>? tags) {
    List<dynamic> _tags = tags ?? [];
    return _tags.map<Map<String, dynamic>>((tag) => toJson(tag)).toList();
  }

  //decode a String to List of objects for shared pref
  List<Tag> decodeTags(List<dynamic>? tags) {
    List<dynamic> _tags = tags ?? [];
    return _tags.map<Tag>((tag) => Tag.fromJson(tag)).toList();
  }
}
