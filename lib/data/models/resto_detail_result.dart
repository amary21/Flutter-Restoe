import 'dart:convert';

RestoDetailResult restoDetailResultFromJson(String str) => RestoDetailResult.fromJson(json.decode(str));

String restoDetailResultToJson(RestoDetailResult data) => json.encode(data.toJson());

class RestoDetailResult {
    RestoDetailResult({
        this.error,
        this.message,
        this.restaurant,
    });

    bool error;
    String message;
    Restaurant restaurant;

    factory RestoDetailResult.fromJson(Map<String, dynamic> json) => RestoDetailResult(
        error: json["error"],
        message: json["message"],
        restaurant: Restaurant.fromJson(json["restaurant"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "restaurant": restaurant.toJson(),
    };
}

class Restaurant {
    Restaurant({
        this.id,
        this.name,
        this.description,
        this.city,
        this.address,
        this.pictureId,
        this.categories,
        this.menus,
        this.rating,
        this.customerReviews,
    });

    String id;
    String name;
    String description;
    String city;
    String address;
    String pictureId;
    List<Category> categories;
    Menus menus;
    double rating;
    List<CustomerReview> customerReviews;

    factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        menus: Menus.fromJson(json["menus"]),
        rating: json["rating"].toDouble(),
        customerReviews: List<CustomerReview>.from(json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "city": city,
        "address": address,
        "pictureId": pictureId,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "menus": menus.toJson(),
        "rating": rating,
        "customerReviews": List<dynamic>.from(customerReviews.map((x) => x.toJson())),
    };
}

class Category {
    Category({
        this.name,
    });

    String name;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}

class CustomerReview {
    CustomerReview({
        this.name,
        this.review,
        this.date,
    });

    String name;
    String review;
    Date date;

    factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
        name: json["name"],
        review: json["review"],
        date: dateValues.map[json["date"]],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "review": review,
        "date": dateValues.reverse[date],
    };
}

enum Date { THE_13_NOVEMBER_2019, THE_27_FEBRUARI_2021 }

final dateValues = EnumValues({
    "13 November 2019": Date.THE_13_NOVEMBER_2019,
    "27 Februari 2021": Date.THE_27_FEBRUARI_2021
});

class Menus {
    Menus({
        this.foods,
        this.drinks,
    });

    List<Category> foods;
    List<Category> drinks;

    factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<Category>.from(json["foods"].map((x) => Category.fromJson(x))),
        drinks: List<Category>.from(json["drinks"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
