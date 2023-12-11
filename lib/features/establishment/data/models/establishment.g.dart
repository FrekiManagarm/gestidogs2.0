// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'establishment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Establishment _$EstablishmentFromJson(Map<String, dynamic> json) =>
    Establishment(
      id: json['_id'] as String?,
      owner: json['owner'] == null
          ? null
          : User.fromJson(json['owner'] as Map<String, dynamic>),
      name: json['name'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      emailAddress: json['emailAddress'] as String?,
      employees: (json['employees'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : User.fromJson(e as Map<String, dynamic>))
          .toList(),
      clients: (json['clients'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : User.fromJson(e as Map<String, dynamic>))
          .toList(),
      schedules: (json['schedules'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$EstablishmentToJson(Establishment instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'owner': instance.owner,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'emailAddress': instance.emailAddress,
      'employees': instance.employees,
      'clients': instance.clients,
      'schedules': instance.schedules,
    };

EstablishmentRequest _$EstablishmentRequestFromJson(
        Map<String, dynamic> json) =>
    EstablishmentRequest(
      address: json['address'] as String?,
      description: json['description'] as String?,
      emailAddress: json['emailAddress'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      schedules: (json['schedules'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$EstablishmentRequestToJson(
        EstablishmentRequest instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'emailAddress': instance.emailAddress,
      'schedules': instance.schedules,
    };
