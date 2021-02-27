class Foods {
  String name;

  Foods({
    this.name,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }

  Foods.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
}
