// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reservation _$ReservationFromJson(Map<String, dynamic> json) => Reservation(
      activity: json['activity'] == null
          ? null
          : Activity.fromJson(json['activity'] as Map<String, dynamic>),
      dogs: (json['dogs'] as List<dynamic>?)
          ?.map((e) => Dog.fromJson(e as Map<String, dynamic>))
          .toList(),
      establishment: json['establishment'] == null
          ? null
          : Establishment.fromJson(
              json['establishment'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      isApproved: json['isApproved'] as bool?,
      session: json['session'] == null
          ? null
          : Session.fromJson(json['session'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ReservationToJson(Reservation instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'activity': instance.activity,
      'establishment': instance.establishment,
      'session': instance.session,
      'dogs': instance.dogs,
      'status': instance.status,
      'isApproved': instance.isApproved,
    };

ReservationRequest _$ReservationRequestFromJson(Map<String, dynamic> json) =>
    ReservationRequest(
      activity: json['activity'] as String?,
      dogs: (json['dogs'] as List<dynamic>?)?.map((e) => e as String).toList(),
      establishment: json['establishment'] as String?,
      isApproved: json['isApproved'] as bool?,
      session: json['session'] as String?,
    );

Map<String, dynamic> _$ReservationRequestToJson(ReservationRequest instance) =>
    <String, dynamic>{
      'activity': instance.activity,
      'establishment': instance.establishment,
      'session': instance.session,
      'dogs': instance.dogs,
      'isApproved': instance.isApproved,
    };
