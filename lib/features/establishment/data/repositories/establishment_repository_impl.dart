import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/establishment/data/datasources/remote_establishment_datasource.dart';
import 'package:clean_architecture_project/features/establishment/data/models/establishment.dart';
import 'package:clean_architecture_project/features/establishment/domain/entities/establishment_entity.dart';
import 'package:clean_architecture_project/features/establishment/domain/repositories/establishment_repository.dart';
import 'package:dio/dio.dart';

class EstablishmentRepositoryImpl implements EstablishmentRepository {
  final EstablishmentApiService apiService;

  EstablishmentRepositoryImpl(this.apiService);

  @override
  Future<DataState<Establishment>> createEstablishment(
      EstablishmentRequestEntity? request) async {
    try {
      var response = await apiService.createEstablishment(
        request: EstablishmentRequest.fromEntity(request!),
        accept: "application/json",
        contentType: "application/json",
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
  Future<DataState<Establishment>> getEstablishmentById(
      String? establishmentId) async {
    try {
      var response = await apiService.getEstablishmentById(
        establishmentId: establishmentId,
        accept: 'application/json',
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
  Future<DataState<List<Establishment>>> getEstablishments(
      String? ownerId, String? clientId) async {
    try {
      var response = await apiService.getEstablishments(
        clientId: clientId,
        ownerId: ownerId,
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
  Future<DataState<Establishment>> updateEstablishment(
      EstablishmentRequestEntity? request, String? establishmentId) async {
    try {
      var response = await apiService.updateEstablishment(
        establishmentId: establishmentId,
        body: EstablishmentRequest.fromEntity(request!),
        accept: "application/json",
        contentType: "application/json",
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
