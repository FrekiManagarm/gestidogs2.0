import 'package:clean_architecture_project/core/constants/constants.dart';
import 'package:clean_architecture_project/features/authentication/data/models/user.dart';
import 'package:clean_architecture_project/features/establishment/data/models/establishment.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_establishment_datasource.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class EstablishmentApiService {
  factory EstablishmentApiService(Dio dio) = _EstablishmentApiService;

  @GET("/establishments")
  Future<HttpResponse<List<Establishment>>> getEstablishments({
    @Query('ownerId') String? ownerId,
    @Query('clientId') String? clientId,
    @Header('Accept') String? accept,
  });

  @GET("/establishments/{establishmentId}")
  Future<HttpResponse<Establishment>> getEstablishmentById({
    @Path('establishmentId') String? establishmentId,
    @Header("Accept") String? accept,
  });

  @POST("/establishments")
  Future<HttpResponse<Establishment>> createEstablishment({
    @Body() EstablishmentRequest? request,
    @Header("Accept") String? accept,
    @Header("Content-Type") String? contentType,
  });

  @POST('/establishments/{establishmentId}/newEmployee')
  Future<HttpResponse<List<User>>> addNewEmployee({
    @Path('establishmentId') String? establishmentId,
    @Body() UserRequest? body,
    @Header("Accept") String? accept,
    @Header("Content-Type") String? contentType,
  });

  @POST('/establishments/{establishmentId}/newEmployee')
  Future<HttpResponse<List<User>>> addNewClient({
    @Path('establishmentId') String? establishmentId,
    @Body() UserRequest? body,
    @Header("Accept") String? accept,
    @Header("Content-Type") String? contentType,
  });

  @PUT('/establishments/{establishmentId}')
  Future<HttpResponse<Establishment>> updateEstablishment({
    @Path('establishmentId') String? establishmentId,
    @Body() EstablishmentRequest? body,
    @Header("Accept") String? accept,
    @Header("Content-Type") String? contentType,
  });
}
