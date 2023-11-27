import 'dart:convert';

List<ListItem> listItemFromJson(String str) =>
    List<ListItem>.from(json.decode(str).map((x) => ListItem.fromJson(x)));

String listItemToJson(List<ListItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListItem {
  String title;
  String description;
  dynamic ingredients;
  String image;
  dynamic id;

  ListItem({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.image,
    required this.id,
  });

  factory ListItem.fromJson(Map<String, dynamic> json) => ListItem(
        title: json["title"],
        description: json["description"],
        ingredients: json["ingredients"],
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "ingredients": ingredients,
        "image": image,
        "id": id,
      };
}
