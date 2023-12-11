import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/reservation/data/datasources/remote_reservation_datasource.dart';
import 'package:clean_architecture_project/features/reservation/data/models/reservation.dart';
import 'package:clean_architecture_project/features/reservation/domain/entities/reservation_entity.dart';
import 'package:clean_architecture_project/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:dio/dio.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final ReservationApiService reservationApiService;

  ReservationRepositoryImpl(this.reservationApiService);

  @override
  Future<DataState<String>> approvedReservation(
      String? reservationId, String? educatorId, String? slot) async {
    try {
      var response = await reservationApiService.approvedReservation(
        educatorId: educatorId,
        reservationId: reservationId,
        slot: slot,
      );

      if (response.response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<Reservation>> createReservation(
      ReservationRequestEntity? request) async {
    try {
      var response = await reservationApiService.createReservation(
        request: ReservationRequest.fromEntity(request!),
      );

      if (response.response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<Reservation>> deleteReservation(
      String? reservationId) async {
    try {
      var response = await reservationApiService.deleteReservation(
        reservationId: reservationId,
      );

      if (response.response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<Reservation>> getReservationById(
      String? reservationId) async {
    try {
      var response = await reservationApiService.getReservationById(
          reservationId: reservationId);

      if (response.response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<Reservation>>> getReservations(
      String? sessionId, String? establishmentId, String? status) async {
    try {
      var response = await reservationApiService.getReservations(
        establishmentId: establishmentId,
        sessionId: sessionId,
        status: status,
      );

      if (response.response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<Reservation>> updateReservation(
      String? reservationId, ReservationRequestEntity? request) async {
    try {
      var response = await reservationApiService.updateReservation(
        request: ReservationRequest.fromEntity(request!),
        reservationId: reservationId,
      );

      if (response.response.statusCode == 200) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.response.requestOptions,
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
