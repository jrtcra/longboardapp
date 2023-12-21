import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Report {
  String id;
  int total;
  Map Styles;

  Report({this.id = '', this.total = 0, this.Styles = const {}});

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

@JsonSerializable()
class Style {
  String id;
  String img;
  String title;
  List<Trick> tricks;

  Style({this.id = '', this.img = '', this.title = '', this.tricks = const []});
  factory Style.fromJson(Map<String, dynamic> json) => _$StyleFromJson(json);
  Map<String, dynamic> toJson() => _$StyleToJson(this);
}

@JsonSerializable()
class Trick {
  String id;
  String style;
  String title;
  bool completed;

  Trick({
    this.id = '',
    this.style = '',
    this.title = '',
    this.completed = false,
  });

  factory Trick.fromJson(Map<String, dynamic> json) => _$TrickFromJson(json);
  Map<String, dynamic> toJson() => _$TrickToJson(this);
}
