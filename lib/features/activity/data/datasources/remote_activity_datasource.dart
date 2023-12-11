import 'package:clean_architecture_project/core/constants/constants.dart';
import 'package:clean_architecture_project/features/activity/data/models/activity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_activity_datasource.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class ActivityApiService {
  factory ActivityApiService(Dio dio) = _ActivityApiService;

  @GET('/activities')
  Future<HttpResponse<List<Activity>>> getActivities({
    @Query("establishmentId") String? establishmentId,
    @Header('Accept') String? accept,
  });

  @GET("/activities/{activityId}")
  Future<HttpResponse<Activity>> getActivityById({
    @Path('activityId') String? activityId,
    @Header('Accept') String? accept,
  });

  @POST("/activities")
  Future<HttpResponse<Activity>> createActivity({
    @Body() ActivityRequest? body,
    @Header("Accept") String? accept,
  });

  @PUT("/activities/{activityId}")
  Future<HttpResponse<Activity>> updateActivity({
    @Path('activityId') String? activityId,
    @Body() ActivityRequest? body,
    @Header("Accept") String? accept,
  });
}
