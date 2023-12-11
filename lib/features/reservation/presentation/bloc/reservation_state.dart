import 'package:clean_architecture_project/features/reservation/domain/entities/reservation_entity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class ReservationsState extends Equatable {
  final List<ReservationEntity>? reservations;
  final ReservationEntity? reservation;
  final bool? reservationApproved;
  final DioException? error;

  const ReservationsState({
    this.reservationApproved,
    this.reservation,
    this.error,
    this.reservations,
  });

  @override
  List<Object> get props => [
        error!,
        reservations!,
      ];
}

class ReservationsLoading extends ReservationsState {
  const ReservationsLoading();
}

class ReservationsLoaded extends ReservationsState {
  const ReservationsLoaded(List<ReservationEntity> reservations)
      : super(reservations: reservations);
}

class ReservationsError extends ReservationsState {
  const ReservationsError(DioException error) : super(error: error);
}

class ReservationLoading extends ReservationsState {
  const ReservationLoading();
}

class ReservationLoaded extends ReservationsState {
  const ReservationLoaded(ReservationEntity reservation)
      : super(reservation: reservation);
}

class ReservationError extends ReservationsState {
  const ReservationError(DioException error) : super(error: error);
}

class ReservationApproved extends ReservationsState {
  const ReservationApproved({bool? reservationApproved, DioException? error})
      : super(
          reservationApproved: reservationApproved,
          error: error,
        );
}
