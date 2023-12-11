import 'package:clean_architecture_project/features/authentication/data/models/user.dart';
import 'package:clean_architecture_project/features/establishment/data/models/establishment.dart';
import 'package:clean_architecture_project/features/holidays/domain/entities/holiday_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'holiday_model.g.dart';

@JsonSerializable()
class HolidayModel extends HolidayEntity {
  @JsonKey(name: "_id")
  final String? id;
  final User? employee;
  final Establishment? establishment;
  final String? beginDate;
  final String? endDate;
  final bool? isApproved;
  @JsonKey(name: "__v")
  final int? v;

  const HolidayModel(
      {this.beginDate,
      this.employee,
      this.endDate,
      this.establishment,
      this.id,
      this.isApproved,
      this.v})
      : super(
          beginDate: beginDate,
          employee: employee,
          endDate: endDate,
          establishment: establishment,
          id: id,
          isApproved: isApproved,
          v: v,
        );

  factory HolidayModel.fromJson(Map<String, dynamic> json) =>
      _$HolidayModelFromJson(json);
  Map<String, dynamic> toJson() => _$HolidayModelToJson(this);

  factory HolidayModel.fromEntity(HolidayEntity entity) {
    return HolidayModel(
      beginDate: entity.beginDate,
      employee: User.fromEntity(entity.employee!),
      endDate: entity.endDate,
      establishment: Establishment.fromEntity(entity.establishment!),
      id: entity.id,
      isApproved: entity.isApproved,
      v: entity.v,
    );
  }
}

@JsonSerializable()
class HolidayRequestModel extends HolidaysRequestEntity {
  final String? employee;
  final String? establishment;
  final String? beginDate;
  final String? endDate;
  final String? status;

  const HolidayRequestModel({
    this.beginDate,
    this.employee,
    this.endDate,
    this.establishment,
    this.status,
  }) : super(
          beginDate: beginDate,
          employee: employee,
          endDate: endDate,
          establishment: establishment,
          status: status,
        );

  factory HolidayRequestModel.fromJson(Map<String, dynamic> json) =>
      _$HolidayRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$HolidayRequestModelToJson(this);

  factory HolidayRequestModel.fromEntity(HolidaysRequestEntity entity) {
    return HolidayRequestModel(
      beginDate: entity.beginDate,
      employee: entity.employee,
      endDate: entity.endDate,
      establishment: entity.establishment,
      status: entity.status,
    );
  }
}
