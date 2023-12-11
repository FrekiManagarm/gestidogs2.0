// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holiday_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HolidayModel _$HolidayModelFromJson(Map<String, dynamic> json) => HolidayModel(
      beginDate: json['beginDate'] as String?,
      employee: json['employee'] == null
          ? null
          : User.fromJson(json['employee'] as Map<String, dynamic>),
      endDate: json['endDate'] as String?,
      establishment: json['establishment'] == null
          ? null
          : Establishment.fromJson(
              json['establishment'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      isApproved: json['isApproved'] as bool?,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$HolidayModelToJson(HolidayModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'employee': instance.employee,
      'establishment': instance.establishment,
      'beginDate': instance.beginDate,
      'endDate': instance.endDate,
      'isApproved': instance.isApproved,
      '__v': instance.v,
    };

HolidayRequestModel _$HolidayRequestModelFromJson(Map<String, dynamic> json) =>
    HolidayRequestModel(
      beginDate: json['beginDate'] as String?,
      employee: json['employee'] as String?,
      endDate: json['endDate'] as String?,
      establishment: json['establishment'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$HolidayRequestModelToJson(
        HolidayRequestModel instance) =>
    <String, dynamic>{
      'employee': instance.employee,
      'establishment': instance.establishment,
      'beginDate': instance.beginDate,
      'endDate': instance.endDate,
      'status': instance.status,
    };
