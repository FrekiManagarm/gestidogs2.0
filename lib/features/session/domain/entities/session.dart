import 'package:clean_architecture_project/features/activity/domain/entities/activity_entity.dart';
import 'package:clean_architecture_project/features/authentication/domain/entities/user.dart';
import 'package:clean_architecture_project/features/establishment/domain/entities/establishment_entity.dart';
import 'package:equatable/equatable.dart';

class SessionEntity extends Equatable {
  final String? id;
  final UserEntity? educator;
  final ActivityEntity? activity;
  final EstablishmentEntity? establishment;
  final String? status;
  final int? maximumCapacity;
  final String? report;
  final String? beginDate;
  final String? endDate;

  const SessionEntity({
    this.id,
    this.educator,
    this.activity,
    this.establishment,
    this.status,
    this.maximumCapacity,
    this.report,
    this.beginDate,
    this.endDate,
  });

  @override
  List<Object?> get props {
    return [
      id,
      educator,
      activity,
      establishment,
      status,
      maximumCapacity,
      report,
      beginDate,
      endDate,
    ];
  }
}

class SessionRequestEntity extends Equatable {

  final String? educator;
  final String? activity;
  final String? establishment;
  final String? status;
  final int? maximumCapacity;
  final String? beginDate;
  final String? endDate;

  const SessionRequestEntity({
    this.activity,
    this.beginDate,
    this.educator,
    this.endDate,
    this.establishment,
    this.maximumCapacity,
    this.status,
  });

  @override
  List<Object?> get props {
    return [
      activity,
      beginDate,
      educator,
      endDate,
      establishment,
      maximumCapacity,
      status,
    ];
  }
}
