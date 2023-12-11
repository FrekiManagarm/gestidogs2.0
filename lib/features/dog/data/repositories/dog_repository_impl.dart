import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/dog/data/datasources/remote_dog_datasource.dart';
import 'package:clean_architecture_project/features/dog/data/models/dog.dart';
import 'package:clean_architecture_project/features/dog/domain/entities/dog_entity.dart';
import 'package:clean_architecture_project/features/dog/domain/repositories/dog_repository.dart';
import 'package:dio/dio.dart';

class DogRepositoryImpl implements DogRepository {
  final DogApiService apiService;

  DogRepositoryImpl(this.apiService);

  @override
  Future<DataState<Dog>> createDog(
      DogRequestEntity? body) async {
    try {
      var response = await apiService.createDog(
          body: DogRequest.fromEntity(body!),
          accept: "application/json");

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
  Future<DataState<Dog>> getDogById(
      String? dogId) async {
    try {
      var response = await apiService.getDogById(
        accept: "application/json",
        dogId: dogId,
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
  Future<DataState<List<Dog>>> getDogs(String? ownerId, String? establishmentId) async {
    try {
      var response = await apiService.getDogs(
        accept: "application/json",
        establishmentId: establishmentId,
        ownerId: ownerId,
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
  Future<DataState<Dog>> updateDog(DogRequestEntity? body, String? dogId) async {
    try {
      var response = await apiService.updateDog(
        accept: "application/json",
        body: DogRequest.fromEntity(body!),
        dogId: dogId,
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
