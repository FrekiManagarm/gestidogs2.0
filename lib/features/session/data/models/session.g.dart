// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      id: json['_id'] as String?,
      activity: json['activity'] == null
          ? null
          : Activity.fromJson(json['activity'] as Map<String, dynamic>),
      beginDate: json['beginDate'] as String?,
      educator: json['educator'] == null
          ? null
          : User.fromJson(json['educator'] as Map<String, dynamic>),
      endDate: json['endDate'] as String?,
      establishment: json['establishment'] == null
          ? null
          : Establishment.fromJson(
              json['establishment'] as Map<String, dynamic>),
      maximumCapacity: json['maximumCapacity'] as int?,
      report: json['report'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      '_id': instance.id,
      'educator': instance.educator,
      'activity': instance.activity,
      'establishment': instance.establishment,
      'status': instance.status,
      'maximumCapacity': instance.maximumCapacity,
      'beginDate': instance.beginDate,
      'endDate': instance.endDate,
      'report': instance.report,
    };

SessionRequest _$SessionRequestFromJson(Map<String, dynamic> json) =>
    SessionRequest(
      activity: json['activity'] as String?,
      beginDate: json['beginDate'] as String?,
      educator: json['educator'] as String?,
      endDate: json['endDate'] as String?,
      establishment: json['establishment'] as String?,
      maximumCapacity: json['maximumCapacity'] as int?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$SessionRequestToJson(SessionRequest instance) =>
    <String, dynamic>{
      'educator': instance.educator,
      'activity': instance.activity,
      'establishment': instance.establishment,
      'status': instance.status,
      'maximumCapacity': instance.maximumCapacity,
      'beginDate': instance.beginDate,
      'endDate': instance.endDate,
    };
