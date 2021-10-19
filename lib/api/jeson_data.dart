import 'dart:convert';

// Category
List<Category> categoryFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    required this.name,
    required this.imageUrl,
    required this.total,
    required this.color,
  });

  String? name;
  String? imageUrl;
  int? total;
  String? color;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        imageUrl: json["image_url"],
        total: json["total"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image_url": imageUrl,
        "total": total,
        "color": color,
      };
}

// HeartSpecialists
List<HeartSpecialists> heartSpecialistsFromJson(String str) =>
    List<HeartSpecialists>.from(
        json.decode(str).map((x) => HeartSpecialists.fromJson(x)));

String heartSpecialistsToJson(List<HeartSpecialists> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HeartSpecialists {
  HeartSpecialists({
    required this.name,
    required this.description,
    required this.distance,
    required this.actions,
  });

  String? name;
  String? description;
  double? distance;
  Actions? actions;

  factory HeartSpecialists.fromJson(Map<String, dynamic> json) =>
      HeartSpecialists(
        name: json["name"],
        description: json["description"],
        distance: json["distance"] == null ? null : json["distance"].toDouble(),
        actions: Actions.fromJson(json["actions"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "distance": distance,
        "actions": actions?.toJson(),
      };
}

// DentalCareSpecialists
List<DentalCareSpecialists> dentalCareSpecialistsFromJson(String str) =>
    List<DentalCareSpecialists>.from(
        json.decode(str).map((x) => DentalCareSpecialists.fromJson(x)));

String dentalCareSpecialistsToJson(List<DentalCareSpecialists> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DentalCareSpecialists {
  DentalCareSpecialists({
    required this.name,
    required this.description,
    required this.distance,
    required this.actions,
  });

  String? name;
  String? description;
  double? distance;
  Actions? actions;

  factory DentalCareSpecialists.fromJson(Map<String, dynamic> json) =>
      DentalCareSpecialists(
        name: json["name"],
        description: json["description"],
        distance: json["distance"],
        actions: Actions.fromJson(json["actions"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "distance": distance,
        "actions": actions?.toJson(),
      };
}

// DermatologySpecialists
List<DermatologySpecialists> dermatologySpecialistsFromJson(String str) =>
    List<DermatologySpecialists>.from(
        json.decode(str).map((x) => DermatologySpecialists.fromJson(x)));
String dermatologySpecialistsToJson(List<DermatologySpecialists> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DermatologySpecialists {
  DermatologySpecialists({
    required this.name,
    required this.description,
    required this.distance,
    required this.actions,
  });

  String? name;
  String? description;
  double? distance;
  Actions? actions;

  factory DermatologySpecialists.fromJson(Map<String, dynamic> json) =>
      DermatologySpecialists(
        name: json["name"],
        description: json["description"],
        distance: json["distance"],
        actions: Actions.fromJson(json["actions"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "distance": distance,
        "actions": actions!.toJson(),
      };
}

// Actions
class Actions {
  Actions({
    required this.chat,
    required this.call,
  });

  String? chat;
  String? call;

  factory Actions.fromJson(Map<String, dynamic> json) => Actions(
        chat: json["chat"],
        call: json["call"],
      );

  Map<String, dynamic> toJson() => {
        "chat": chat,
        "call": call,
      };
}
