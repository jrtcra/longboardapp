import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Report {
  String id;
  int total;

  Report({
    this.id = '',
    this.total = 0,
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

@JsonSerializable()
class Style {
  String id;
  String img;
  String title;

  Style({
    this.id = '',
    this.img = '',
    this.title = '',
  });
  factory Style.fromJson(Map<String, dynamic> json) => _$StyleFromJson(json);
  Map<String, dynamic> toJson() => _$StyleToJson(this);
}

@JsonSerializable()
class Trick {
  String id;
  String style;
  String title;

  Trick({
    this.id = '',
    this.style = '',
    this.title = '',
  });

  factory Trick.fromJson(Map<String, dynamic> json) => _$TrickFromJson(json);
  Map<String, dynamic> toJson() => _$TrickToJson(this);
}
