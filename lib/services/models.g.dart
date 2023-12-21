// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      id: json['id'] as String? ?? '',
      total: json['total'] as int? ?? 0,
      Styles: json['Styles'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
      'Styles': instance.Styles,
    };

Style _$StyleFromJson(Map<String, dynamic> json) => Style(
      id: json['id'] as String? ?? '',
      img: json['img'] as String? ?? '',
      title: json['title'] as String? ?? '',
      tricks: (json['tricks'] as List<dynamic>?)
              ?.map((e) => Trick.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$StyleToJson(Style instance) => <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'title': instance.title,
      'tricks': instance.tricks,
    };

Trick _$TrickFromJson(Map<String, dynamic> json) => Trick(
      id: json['id'] as String? ?? '',
      style: json['style'] as String? ?? '',
      title: json['title'] as String? ?? '',
      completed: json['completed'] as bool? ?? false,
    );

Map<String, dynamic> _$TrickToJson(Trick instance) => <String, dynamic>{
      'id': instance.id,
      'style': instance.style,
      'title': instance.title,
      'completed': instance.completed,
    };
