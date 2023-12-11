import 'package:clean_architecture_project/core/constants/constants.dart';
import 'package:clean_architecture_project/features/holidays/data/models/holiday_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_holidays_datasource.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class HolidaysApiService {
  factory HolidaysApiService(Dio dio) = _HolidaysApiService;

  @GET("/holidays")
  Future<HttpResponse<List<HolidayModel>>> getHolidays({
    @Query("employeeId") String? employeeId,
    @Query("establishmentId") String? establishmentId,
    @Header("Accept") String? accept,
    @Header("Content-Type") String? contentType,
  });

  @GET("/holidays/{holidayId}")
  Future<HttpResponse<HolidayModel>> getHolidayById({
    @Path() String? holidayId,
    @Header("Accept") String? accept,
  });

  @POST("/holidays")
  Future<HttpResponse<HolidayModel>> createHoliday({
    @Body() HolidayRequestModel? body,
    @Header("Accept") String? accept,
    @Header("Content-Type") String? contentType,
  });

  @PUT("/holidays/{holidayId}")
  Future<HttpResponse<HolidayModel>> modifyHoliday({
    @Path('holidayId') String? holidayId,
    @Body() HolidayRequestModel? body,
    @Header("Content-Type") String? contentType,
    @Header("Accept") String? accept,
  });
}
