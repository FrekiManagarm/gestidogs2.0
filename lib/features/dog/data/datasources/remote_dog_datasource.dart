import 'package:clean_architecture_project/core/constants/constants.dart';
import 'package:clean_architecture_project/features/dog/data/models/dog.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_dog_datasource.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class DogApiService {
  factory DogApiService(Dio dio) = _DogApiService;

  @GET('/dogs')
  Future<HttpResponse<List<Dog>>> getDogs({
    @Query('ownerId') String? ownerId,
    @Query('establishmentId') String? establishmentId,
    @Header('Accept') String? accept,
  });

  @GET('/dogs/{dogId}')
  Future<HttpResponse<Dog>> getDogById({
    @Path("dogId") String? dogId,
    @Header("Accept") String? accept,
  });

  @POST("/dogs")
  Future<HttpResponse<Dog>> createDog({
    @Body() DogRequest? body,
    @Header('Accept') String? accept,
  });

  @PUT("/dogs/{dogId}")
  Future<HttpResponse<Dog>> updateDog({
    @Body() DogRequest? body,
    @Path("dogId") String? dogId,
    @Header("Accept") String? accept,
  });
}
