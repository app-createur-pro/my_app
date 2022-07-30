class Category {
  int? id;
  String? name;

  Category({
    this.id,
    this.name,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id']);
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id.toString();
    data['name'] = this.name;
    return data;
  }
}
