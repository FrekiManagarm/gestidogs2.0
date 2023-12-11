// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      description: json['description'] as String?,
      duration: json['duration'] as int?,
      establishment: json['establishment'] == null
          ? null
          : Establishment.fromJson(
              json['establishment'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      imageUrl: json['imageUrl'] as String?,
      price: json['price'] as int?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      '_id': instance.id,
      'establishment': instance.establishment,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'duration': instance.duration,
      'price': instance.price,
    };

ActivityRequest _$ActivityRequestFromJson(Map<String, dynamic> json) =>
    ActivityRequest(
      description: json['description'] as String?,
      duration: json['duration'] as int?,
      establishment: json['establishment'] as String?,
      imageUrl: json['imageUrl'] as String?,
      price: json['price'] as int?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$ActivityRequestToJson(ActivityRequest instance) =>
    <String, dynamic>{
      'establishment': instance.establishment,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'duration': instance.duration,
    };
