import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/reservation/domain/entities/reservation_entity.dart';

abstract class ReservationRepository {
  Future<DataState<List<ReservationEntity>>> getReservations(
      String? sessionId, String? establishmentId, String? status);

  Future<DataState<ReservationEntity>> getReservationById(
    String? reservationId,
  );

  Future<DataState<ReservationEntity>> createReservation(
    ReservationRequestEntity? request,
  );

  Future<DataState<String>> approvedReservation(
    String? reservationId,
    String? educatorId,
    String? slot,
  );

  Future<DataState<ReservationEntity>> updateReservation(
    String? reservationId,
    ReservationRequestEntity? request,
  );

  Future<DataState<ReservationEntity>> deleteReservation(
    String? reservationId,
  );
}
