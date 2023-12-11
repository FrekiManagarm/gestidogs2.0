import 'package:clean_architecture_project/core/constants/constants.dart';
import 'package:clean_architecture_project/features/session/data/models/session.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_session_datasource.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class SessionApiService {
  factory SessionApiService(Dio dio) = _SessionApiService;

  @GET('/sessions')
  Future<HttpResponse<List<Session>>> getSessions({
    @Query('reserved') bool? reserved,
    @Query('educatorId') String? educatorId,
    @Query('activityId') String? activityId,
    @Query('establishmentId') String? establishmentId,
    @Query('begin') String? begin,
    @Query('end') String? end,
  });

  @GET('/sessions/daily/{dogId}')
  Future<HttpResponse<List<Session>>> getDailySessions({
    @Path('dogId') String? dogId,
    @Query('date') String? date,
    @Query('establishmentId') String? establishmentId,
  });

  @GET('/sessions/{sessionId}')
  Future<HttpResponse<Session>> getSessionById({
    @Path('id') String? sessionId,
  });

  @GET('/sessions/{sessionId}/remaining-places')
  Future<HttpResponse<int>> getSessionRemainingPlaces({
    @Path('sessionId') String? sessionId,
  });

  @POST('/sessions')
  Future<HttpResponse<Session>> createSession({
    @Body() SessionRequest? body,
  });

  @POST('/sessions/{sessionId}/report')
  Future<HttpResponse<Session>> postSessionReport({
    @Path('sessionId') String? sessionId,
    @Body() String? report,
  });

  @PUT('/sessions/{sessionId}')
  Future<HttpResponse<Session>> updateSession({
    @Path('sessionId') String? sessionId,
    @Body() SessionRequest? body,
  });
}
