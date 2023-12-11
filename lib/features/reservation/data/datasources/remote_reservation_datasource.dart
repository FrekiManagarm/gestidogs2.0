import 'package:clean_architecture_project/core/constants/constants.dart';
import 'package:clean_architecture_project/features/reservation/data/models/reservation.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_reservation_datasource.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class ReservationApiService {
  factory ReservationApiService(Dio dio) = _ReservationApiService;

  @GET('/reservations')
  Future<HttpResponse<List<Reservation>>> getReservations({
    @Query("sessionId") String? sessionId,
    @Query("establishmentId") String? establishmentId,
    @Query("status") String? status,
  });

  @GET("/reservations/{reservationId}")
  Future<HttpResponse<Reservation>> getReservationById({
    @Path('reservationId') String? reservationId,
  });

  @POST("/reservations")
  Future<HttpResponse<Reservation>> createReservation({
    @Body() ReservationRequest? request,
  });

  @POST("/reservations/{reservationId}/approved")
  Future<HttpResponse<String>> approvedReservation({
    @Path('reservationId') String? reservationId,
    @Query('educatorId') String? educatorId,
    @Query('slot') String? slot,
  });

  @PUT("/reservations/{reservationId}")
  Future<HttpResponse<Reservation>> updateReservation({
    @Path('reservationId') String? reservationId,
    @Body() ReservationRequest? request,
  });

  @DELETE("/reservations/{reservationId}")
  Future<HttpResponse<Reservation>> deleteReservation({
    @Path('reservationId') String? reservationId,
  });
}
