import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/activity/data/datasources/remote_activity_datasource.dart';
import 'package:clean_architecture_project/features/activity/data/models/activity.dart';
import 'package:clean_architecture_project/features/activity/domain/entities/activity_entity.dart';
import 'package:clean_architecture_project/features/activity/domain/repositories/activity_repository.dart';
import 'package:dio/dio.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final ActivityApiService apiService;

  ActivityRepositoryImpl(this.apiService);

  @override
  Future<DataState<Activity>> createActivity(ActivityRequestEntity? body) async {
    try {
      var response = await apiService.createActivity(
        body: ActivityRequest.fromEntity(body!),
        accept: "application/json",
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
  Future<DataState<List<Activity>>> getActivities(
      String? establishmentId) async {
    try {
      var response = await apiService.getActivities(
        accept: "application/json",
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
  Future<DataState<Activity>> getActivityById(
      String? activityId) async {
    try {
      var response = await apiService.getActivityById(
        accept: "application/json",
        activityId: activityId,
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
  Future<DataState<Activity>> updateActivity(ActivityRequestEntity? body,
      String? activityId) async {
    try {
      var response = await apiService.updateActivity(
        accept: "application/json",
        activityId: activityId,
        body: ActivityRequest.fromEntity(body!),
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
