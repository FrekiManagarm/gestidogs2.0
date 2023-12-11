// ignore_for_file: must_be_immutable

import 'package:clean_architecture_project/features/activity/data/models/activity.dart';
import 'package:clean_architecture_project/features/authentication/data/models/user.dart';
import 'package:clean_architecture_project/features/establishment/data/models/establishment.dart';
import 'package:clean_architecture_project/features/session/domain/entities/session.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class Session extends SessionEntity {
  @JsonKey(name: "_id")
  final String? id;
  final User? educator;
  final Activity? activity;
  final Establishment? establishment;
  final String? status;
  final int? maximumCapacity;
  final String? beginDate;
  final String? endDate;
  final String? report;

  const Session({
    this.id,
    this.activity,
    this.beginDate,
    this.educator,
    this.endDate,
    this.establishment,
    this.maximumCapacity,
    this.report,
    this.status,
  }) : super(
          id: id,
          activity: activity,
          beginDate: beginDate,
          educator: educator,
          endDate: endDate,
          establishment: establishment,
          maximumCapacity: maximumCapacity,
          report: report,
          status: status,
        );

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
  Map<String, dynamic> toJson() => _$SessionToJson(this);

  factory Session.fromEntity(SessionEntity entity) {
    return Session(
      id: entity.id,
      activity: Activity.fromEntity(entity.activity!),
      beginDate: entity.beginDate,
      educator: User.fromEntity(entity.educator!),
      endDate: entity.endDate,
      establishment: Establishment.fromEntity(entity.establishment!),
      maximumCapacity: entity.maximumCapacity,
      report: entity.report,
      status: entity.report,
    );
  }
}

@JsonSerializable()
class SessionRequest extends SessionRequestEntity {
  const SessionRequest({
    String? activity,
    String? beginDate,
    String? educator,
    String? endDate,
    String? establishment,
    int? maximumCapacity,
    String? status,
  }) : super(
          activity: activity,
          beginDate: beginDate,
          educator: educator,
          endDate: endDate,
          establishment: establishment,
          maximumCapacity: maximumCapacity,
          status: status,
        );

  factory SessionRequest.fromJson(Map<String, dynamic> json) =>
      _$SessionRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SessionRequestToJson(this);

  factory SessionRequest.fromEntity(SessionRequestEntity entity) {
    return SessionRequest(
      educator: entity.educator,
      activity: entity.activity,
      beginDate: entity.beginDate,
      endDate: entity.endDate,
      establishment: entity.establishment,
      maximumCapacity: entity.maximumCapacity,
      status: entity.status,
    );
  }
}
