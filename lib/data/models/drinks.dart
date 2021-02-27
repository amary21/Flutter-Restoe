class Drinks {
  String name;

  Drinks({
    this.name,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }

  Drinks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}