import 'package:clean_architecture_project/features/activity/data/models/activity.dart';
import 'package:clean_architecture_project/features/dog/data/models/dog.dart';
import 'package:clean_architecture_project/features/establishment/data/models/establishment.dart';
import 'package:clean_architecture_project/features/reservation/domain/entities/reservation_entity.dart';
import 'package:clean_architecture_project/features/session/data/models/session.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reservation.g.dart';

@JsonSerializable()
class Reservation extends ReservationEntity {
  @JsonKey(name: "_id")
  final String? id;
  final Activity? activity;
  final Establishment? establishment;
  final Session? session;
  final List<Dog>? dogs;
  final String? status;
  final bool? isApproved;

  const Reservation(
      {this.activity,
      this.dogs,
      this.establishment,
      this.id,
      this.isApproved,
      this.session,
      this.status})
      : super(
          activity: activity,
          dogs: dogs,
          establishment: establishment,
          isApproved: isApproved,
          id: id,
          session: session,
          status: status,
        );

  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);
  Map<String, dynamic> toJson() => _$ReservationToJson(this);

  factory Reservation.fromEntity(ReservationEntity entity) {
    return Reservation(
      id: entity.id,
      activity: Activity.fromEntity(entity.activity!),
      dogs: entity.dogs!.map((e) => Dog.fromEntity(e)).toList(),
      establishment: Establishment.fromEntity(entity.establishment!),
      isApproved: entity.isApproved,
      session: Session.fromEntity(entity.session!),
      status: entity.status,
    );
  }
}

@JsonSerializable()
class ReservationRequest extends ReservationRequestEntity {
  final String? activity;
  final String? establishment;
  final String? session;
  final List<String>? dogs;
  final bool? isApproved;

  const ReservationRequest({
    this.activity,
    this.dogs,
    this.establishment,
    this.isApproved,
    this.session,
  }) : super(
          activity: activity,
          dogs: dogs,
          establishment: establishment,
          isApproved: isApproved,
          session: session,
        );

  factory ReservationRequest.fromJson(Map<String, dynamic> json) =>
      _$ReservationRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ReservationRequestToJson(this);

  factory ReservationRequest.fromEntity(ReservationRequestEntity entity) {
    return ReservationRequest(
      activity: entity.activity,
      dogs: entity.dogs,
      establishment: entity.establishment,
      isApproved: entity.isApproved,
      session: entity.session,
    );
  }
}
