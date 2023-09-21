// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      id: json['id'] as String? ?? '',
      total: json['total'] as int? ?? 0,
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
    };

Style _$StyleFromJson(Map<String, dynamic> json) => Style(
      id: json['id'] as String? ?? '',
      img: json['img'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$StyleToJson(Style instance) => <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'title': instance.title,
    };

Trick _$TrickFromJson(Map<String, dynamic> json) => Trick(
      id: json['id'] as String? ?? '',
      style: json['style'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );

Map<String, dynamic> _$TrickToJson(Trick instance) => <String, dynamic>{
      'id': instance.id,
      'style': instance.style,
      'title': instance.title,
    };
