import 'package:clean_architecture_project/features/activity/domain/entities/activity_entity.dart';
import 'package:clean_architecture_project/features/dog/domain/entities/dog_entity.dart';
import 'package:clean_architecture_project/features/establishment/domain/entities/establishment_entity.dart';
import 'package:clean_architecture_project/features/session/domain/entities/session.dart';
import 'package:equatable/equatable.dart';

class ReservationEntity extends Equatable {
  final String? id;
  final ActivityEntity? activity;
  final EstablishmentEntity? establishment;
  final SessionEntity? session;
  final List<DogEntity>? dogs;
  final String? status;
  final bool? isApproved;

  const ReservationEntity({
    this.id,
    this.activity,
    this.establishment,
    this.session,
    this.dogs,
    this.isApproved,
    this.status,
  });

  @override
  List<Object?> get props {
    return [
      id,
      activity,
      establishment,
      session,
      dogs,
      status,
      isApproved,
    ];
  }
}

class ReservationRequestEntity extends Equatable {
  final String? activity;
  final String? establishment;
  final String? session;
  final List<String>? dogs;
  final bool? isApproved;

  const ReservationRequestEntity({
    this.activity,
    this.dogs,
    this.establishment,
    this.isApproved,
    this.session,
  });

  @override
  List<Object?> get props {
    return [
      activity,
      dogs,
      establishment,
      isApproved,
      session,
    ];
  }
}
