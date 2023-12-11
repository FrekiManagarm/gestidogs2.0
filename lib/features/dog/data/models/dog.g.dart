// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dog _$DogFromJson(Map<String, dynamic> json) => Dog(
      id: json['_id'] as String?,
      owner: json['owner'] == null
          ? null
          : User.fromJson(json['owner'] as Map<String, dynamic>),
      establishment: json['establishment'] == null
          ? null
          : Establishment.fromJson(
              json['establishment'] as Map<String, dynamic>),
      nationalId: json['nationalId'] as String?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
      gender: json['gender'] as String?,
      breed: json['breed'] as String?,
      birthDate: json['birthDate'] as String?,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
    );

Map<String, dynamic> _$DogToJson(Dog instance) => <String, dynamic>{
      '_id': instance.id,
      'owner': instance.owner,
      'establishment': instance.establishment,
      'nationalId': instance.nationalId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'gender': instance.gender,
      'breed': instance.breed,
      'birthDate': instance.birthDate,
      'height': instance.height,
      'weight': instance.weight,
    };

DogRequest _$DogRequestFromJson(Map<String, dynamic> json) => DogRequest(
      breed: json['breed'] as String?,
      establishment: json['establishment'] as String?,
      gender: json['gender'] as String?,
      height: json['height'] as int?,
      imageUrl: json['imageUrl'] as String?,
      name: json['name'] as String?,
      nationalId: json['nationalId'] as String?,
      owner: json['owner'] as String?,
      weight: json['weight'] as int?,
    );

Map<String, dynamic> _$DogRequestToJson(DogRequest instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'establishment': instance.establishment,
      'nationalId': instance.nationalId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'gender': instance.gender,
      'breed': instance.breed,
      'weight': instance.weight,
      'height': instance.height,
    };
