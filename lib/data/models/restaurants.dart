import 'dart:convert';
import 'package:restoe/data/models/menus.dart';

class Restaurants {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menus menu;

  Restaurants({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menu,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['pictureId'] = this.pictureId;
    data['city'] = this.city;
    data['rating'] = this.rating;
    if (this.menu != null) {
      data['menus'] = this.menu;
    }
    return data;
  }

  Restaurants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pictureId = json['pictureId'];
    city = json['city'];
    rating = json['rating'].toDouble();
    menu = json['menus'] != null ? new Menus.fromJson(json['menus']) : null;
  }

  List<Restaurants> parseRestaurants(String json) {
    if (json == null) {
      return [];
    }

    final List parsed = jsonDecode(json)['restaurants'];
    return parsed.map((e) => Restaurants.fromJson(e)).toList();
  }
}
