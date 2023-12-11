import 'package:clean_architecture_project/features/reservation/data/models/reservation.dart';

abstract class ReservationsEvent {
  const ReservationsEvent();
}

class GetReservationsEvent extends ReservationsEvent {
  final String? sessionId;
  final String? establishmentId;
  final String? status;

  const GetReservationsEvent({
    this.establishmentId,
    this.sessionId,
    this.status,
  });
}

class GetReservationsByIdEvent extends ReservationsEvent {
  final String? reservationId;

  const GetReservationsByIdEvent({this.reservationId});
}

class CreateReservationEvent extends ReservationsEvent {
  final ReservationRequest? body;

  const CreateReservationEvent({
    this.body,
  });
}

class ApprovedReservationEvent extends ReservationsEvent {
  final String? reservationId;
  final String? educatorId;
  final String? slot;

  const ApprovedReservationEvent({
    this.educatorId,
    this.reservationId,
    this.slot,
  });
}

class UpdateReservationEvent extends ReservationsEvent {
  final String? reservationId;
  final ReservationRequest? body;

  const UpdateReservationEvent({
    this.body,
    this.reservationId,
  });
}

class DeleteReservationEvent extends ReservationsEvent {
  final String? reservationId;

  const DeleteReservationEvent({
    this.reservationId,
  });
}