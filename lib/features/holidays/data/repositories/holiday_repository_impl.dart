import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/holidays/data/datasources/remote_holidays_datasource.dart';
import 'package:clean_architecture_project/features/holidays/data/models/holiday_model.dart';
import 'package:clean_architecture_project/features/holidays/domain/entities/holiday_entity.dart';
import 'package:clean_architecture_project/features/holidays/domain/repositories/holiday_repository.dart';
import 'package:dio/dio.dart';

class HolidayRepositoryImpl implements HolidayRepository {
  final HolidaysApiService apiService;

  const HolidayRepositoryImpl(this.apiService);

  @override
  Future<DataState<HolidayModel>> createHoliday(
      {HolidaysRequestEntity? body}) async {
    try {
      final response = await apiService.createHoliday(
        accept: "application/json",
        contentType: "application/json",
        body: HolidayRequestModel.fromEntity(body!),
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
  Future<DataState<HolidayModel>> getHolidayById({String? holidayId}) async {
    try {
      final response = await apiService.getHolidayById(
        accept: "application/json",
        holidayId: holidayId,
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
  Future<DataState<List<HolidayModel>>> getHolidays(
      {String? employeeId, String? establishmentId}) async {
    try {
      final response = await apiService.getHolidays(
        accept: "application/json",
        contentType: "application/json",
        employeeId: employeeId,
        establishmentId: establishmentId,
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
  Future<DataState<HolidayModel>> modifyHoliday(
      {String? holidayId, HolidaysRequestEntity? body}) async {
    try {
      final response = await apiService.modifyHoliday(
        accept: "application/json",
        contentType: "application/json",
        body: HolidayRequestModel.fromEntity(body!),
        holidayId: holidayId,
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
