// To parse this JSON data, do
//
//     final statisicCovid = statisicCovidFromJson(jsonString);

import 'dart:convert';

StatisicCovid statisicCovidFromJson(String str) =>
    StatisicCovid.fromJson(json.decode(str));

String statisicCovidToJson(StatisicCovid data) => json.encode(data.toJson());

class StatisicCovid {
  StatisicCovid({
    this.item,
  });

  List<Item>? item;

  factory StatisicCovid.fromJson(Map<String, dynamic> json) => StatisicCovid(
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "item": List<dynamic>.from(item!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.title,
    this.color,
    this.detail,
  });

  String? title;
  String? color;
  List<Detail>? detail;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        title: json["title"],
        color: json["color"],
        detail:
            List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "color": color,
        "detail": List<dynamic>.from(detail!.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    this.location,
    this.total,
    this.count,
  });

  String? location;
  int? total;
  int? count;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        location: json["location"],
        total: json["total"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "location": location,
        "total": total,
        "count": count,
      };
}
