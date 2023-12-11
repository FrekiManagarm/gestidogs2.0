import 'package:clean_architecture_project/core/constants/constants.dart';
import 'package:clean_architecture_project/features/authentication/data/models/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_user_datasource.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class UserApiService {
  factory UserApiService(Dio dio) = _UserApiService;

  @GET("/users")
  Future<HttpResponse<List<User>>> getUsers({
    @Query('establishmentId') String? establishmentId,
    @Query('role') String? role,
    @Header("Accept") String? accept,
  });

  @GET("/users/me")
  Future<HttpResponse<User>> getUserConnected();

  @POST("/users/login")
  Future<HttpResponse<LoginResponse>> login({
    @Body() LoginRequest? body,
    @Header('Content-Type') String? contentType,
    @Header("Accept") String? accept,
  });

  @POST("/users/register")
  Future<HttpResponse<LoginResponse>> register({
    @Body() RegisterRequest? body,
    @Header("Accept") String? accept,
    @Header("Content-Type") String? contentType,
  });

  @GET("/users/refresh")
  Future<HttpResponse<RefreshTokensModel>> refreshToken({
    @Query('refreshToken') String? refreshToken,
    @Header("Accept") String? accept,
  });

  @GET('/users/{userId}')
  Future<HttpResponse<User>> getUserById({
    @Path('userId') String? userId,
    @Header("accept") String? accept,
  });

  @GET("/users/establishments/{establishmentId}")
  Future<HttpResponse<List<User>>> getClientsOfEstablishment({
    @Path('establishmentId') String? establishmentId,
    @Header("Accept") String? accept,
  });

  @POST("/users/logout")
  Future<HttpResponse<bool>> logOut();
}
