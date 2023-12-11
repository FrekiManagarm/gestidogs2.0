import 'package:clean_architecture_project/core/managers/storage_manager.dart';
import 'package:clean_architecture_project/features/activity/data/datasources/remote_activity_datasource.dart';
import 'package:clean_architecture_project/features/activity/data/repositories/activity_repository_impl.dart';
import 'package:clean_architecture_project/features/activity/domain/repositories/activity_repository.dart';
import 'package:clean_architecture_project/features/activity/domain/usecases/create_activity.dart';
import 'package:clean_architecture_project/features/activity/domain/usecases/get_activities.dart';
import 'package:clean_architecture_project/features/activity/domain/usecases/get_activity_by_id.dart';
import 'package:clean_architecture_project/features/activity/domain/usecases/update_activity.dart';
import 'package:clean_architecture_project/features/activity/presentation/bloc/activity_bloc.dart';
import 'package:clean_architecture_project/features/authentication/data/datasources/remote_user_datasource.dart';
import 'package:clean_architecture_project/features/authentication/data/repositories/user_repository_impl.dart';
import 'package:clean_architecture_project/features/authentication/domain/repositories/user_repository.dart';
import 'package:clean_architecture_project/features/authentication/domain/usecases/get_clients_of_establishment.dart';
import 'package:clean_architecture_project/features/authentication/domain/usecases/get_logged_user.dart';
import 'package:clean_architecture_project/features/authentication/domain/usecases/get_users.dart';
import 'package:clean_architecture_project/features/authentication/domain/usecases/log_out.dart';
import 'package:clean_architecture_project/features/authentication/domain/usecases/refresh_token.dart';
import 'package:clean_architecture_project/features/authentication/domain/usecases/user_login.dart';
import 'package:clean_architecture_project/features/authentication/domain/usecases/user_register.dart';
import 'package:clean_architecture_project/features/authentication/presentation/bloc/user_bloc.dart';
import 'package:clean_architecture_project/features/dog/data/datasources/remote_dog_datasource.dart';
import 'package:clean_architecture_project/features/dog/data/repositories/dog_repository_impl.dart';
import 'package:clean_architecture_project/features/dog/domain/repositories/dog_repository.dart';
import 'package:clean_architecture_project/features/dog/domain/usecases/create_dog.dart';
import 'package:clean_architecture_project/features/dog/domain/usecases/get_dog_by_id.dart';
import 'package:clean_architecture_project/features/dog/domain/usecases/get_dogs.dart';
import 'package:clean_architecture_project/features/dog/domain/usecases/update_dog.dart';
import 'package:clean_architecture_project/features/establishment/data/datasources/remote_establishment_datasource.dart';
import 'package:clean_architecture_project/features/establishment/data/repositories/establishment_repository_impl.dart';
import 'package:clean_architecture_project/features/establishment/domain/repositories/establishment_repository.dart';
import 'package:clean_architecture_project/features/establishment/domain/usecases/create_establishment.dart';
import 'package:clean_architecture_project/features/establishment/domain/usecases/get_establishment_by_id.dart';
import 'package:clean_architecture_project/features/establishment/domain/usecases/get_establishments.dart';
import 'package:clean_architecture_project/features/establishment/presentation/bloc/establishment_bloc.dart';
import 'package:clean_architecture_project/features/holidays/data/datasources/remote_holidays_datasource.dart';
import 'package:clean_architecture_project/features/holidays/data/repositories/holiday_repository_impl.dart';
import 'package:clean_architecture_project/features/holidays/domain/repositories/holiday_repository.dart';
import 'package:clean_architecture_project/features/holidays/domain/usecases/create_holiday.dart';
import 'package:clean_architecture_project/features/holidays/domain/usecases/get_holidays.dart';
import 'package:clean_architecture_project/features/holidays/domain/usecases/get_holidays_by_id.dart';
import 'package:clean_architecture_project/features/holidays/domain/usecases/update_holiday.dart';
import 'package:clean_architecture_project/features/holidays/presentation/bloc/holidays_bloc.dart';
import 'package:clean_architecture_project/features/reservation/data/datasources/remote_reservation_datasource.dart';
import 'package:clean_architecture_project/features/reservation/data/repositories/reservation_repository_impl.dart';
import 'package:clean_architecture_project/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:clean_architecture_project/features/reservation/domain/usecases/approved_reservation.dart';
import 'package:clean_architecture_project/features/reservation/domain/usecases/create_reservation.dart';
import 'package:clean_architecture_project/features/reservation/domain/usecases/get_reservations.dart';
import 'package:clean_architecture_project/features/reservation/domain/usecases/update_reservation.dart';
import 'package:clean_architecture_project/features/reservation/presentation/bloc/reservation_bloc.dart';
import 'package:clean_architecture_project/features/session/data/datasources/remote_session_datasource.dart';
import 'package:clean_architecture_project/features/session/data/repositories/session_repository_impl.dart';
import 'package:clean_architecture_project/features/session/domain/repositories/session_repository.dart';
import 'package:clean_architecture_project/features/session/domain/usecases/create_session.dart';
import 'package:clean_architecture_project/features/session/domain/usecases/get_daily_session.dart';
import 'package:clean_architecture_project/features/session/domain/usecases/get_remaining_places.dart';
import 'package:clean_architecture_project/features/session/domain/usecases/get_sessions.dart';
import 'package:clean_architecture_project/features/session/domain/usecases/update_session.dart';
import 'package:clean_architecture_project/features/session/presentation/bloc/session_bloc.dart';
import 'package:clean_architecture_project/utils/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
const storage = FlutterSecureStorage();

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(dioClient);

  // FlutterSecureStorage
  sl.registerSingleton<FlutterSecureStorage>(storage);

  // Storage Manager
  sl.registerSingleton<StorageManager>(StorageManager(sl()));

  ////////////////////////////// DEPENDENCIES //////////////////////////////////

  // Session
  sl.registerSingleton<SessionApiService>(SessionApiService(sl()));
  sl.registerSingleton<SessionRepository>(
      SessionRepositoryImpl(apiService: sl()));

  // Reservation
  sl.registerSingleton<ReservationApiService>(ReservationApiService(sl()));
  sl.registerSingleton<ReservationRepository>(ReservationRepositoryImpl(sl()));

  // Establishment
  sl.registerSingleton<EstablishmentApiService>(EstablishmentApiService(sl()));
  sl.registerSingleton<EstablishmentRepository>(
      EstablishmentRepositoryImpl(sl()));

  // Dog
  sl.registerSingleton<DogApiService>(DogApiService(sl()));
  sl.registerSingleton<DogRepository>(DogRepositoryImpl(sl()));

  // Activity
  sl.registerSingleton<ActivityApiService>(ActivityApiService(sl()));
  sl.registerSingleton<ActivityRepository>(ActivityRepositoryImpl(sl()));

  // User
  sl.registerSingleton<UserApiService>(UserApiService(sl()));
  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));

  // Holidays
  sl.registerSingleton<HolidaysApiService>(HolidaysApiService(sl()));
  sl.registerSingleton<HolidayRepository>(HolidayRepositoryImpl(sl()));

  //////////////////////////// USECASES ////////////////////////////////////////

  // Session
  sl.registerSingleton<GetSessionsUseCase>(GetSessionsUseCase(sl()));
  sl.registerSingleton<GetDailySessionsUseCase>(GetDailySessionsUseCase(sl()));
  sl.registerSingleton<CreateSessionUseCase>(CreateSessionUseCase(sl()));
  sl.registerSingleton<UpdateSessionUseCase>(UpdateSessionUseCase(sl()));
  sl.registerSingleton<GetSessionRemainingPlacesUseCase>(
      GetSessionRemainingPlacesUseCase(sl()));

  // Reservation
  sl.registerSingleton<GetReservationsUseCase>(GetReservationsUseCase(sl()));
  sl.registerSingleton<ApprovedReservationUseCase>(
      ApprovedReservationUseCase(sl()));
  sl.registerSingleton<UpdateReservationUseCase>(
      UpdateReservationUseCase(sl()));
  sl.registerSingleton<CreateReservationUseCase>(
      CreateReservationUseCase(sl()));

  // Establishment
  sl.registerSingleton<GetEstablishmentsUseCase>(
      GetEstablishmentsUseCase(sl()));
  sl.registerSingleton<GetEstablishmentByIdUseCase>(
      GetEstablishmentByIdUseCase(sl()));
  sl.registerSingleton<CreateEstablishmentUseCase>(
      CreateEstablishmentUseCase(sl()));
  sl.registerSingleton<UpdateReservationUseCase>(
      UpdateReservationUseCase(sl()));

  // Dog
  sl.registerSingleton<GetDogsUseCase>(GetDogsUseCase(sl()));
  sl.registerSingleton<GetDogByIdUseCase>(GetDogByIdUseCase(sl()));
  sl.registerSingleton<CreateDogUseCase>(CreateDogUseCase(sl()));
  sl.registerSingleton<UpdateDogUseCase>(UpdateDogUseCase(sl()));

  // Activity
  sl.registerSingleton<GetActivitiesUseCase>(GetActivitiesUseCase(sl()));
  sl.registerSingleton<GetActivityByIdUseCase>(GetActivityByIdUseCase(sl()));
  sl.registerSingleton<CreateActivityUseCase>(CreateActivityUseCase(sl()));
  sl.registerSingleton<UpdateActivityUseCase>(UpdateActivityUseCase(sl()));

  // User
  sl.registerSingleton<GetClientsOfEstablishmentUseCase>(
      GetClientsOfEstablishmentUseCase(sl()));
  sl.registerSingleton<GetLoggedUserUseCase>(GetLoggedUserUseCase(sl()));
  sl.registerSingleton<GetUsersUseCase>(GetUsersUseCase(sl()));
  sl.registerSingleton<LogOutUseCase>(LogOutUseCase(sl()));
  sl.registerSingleton<RefreshTokenUseCase>(RefreshTokenUseCase(sl()));
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));

  // Holidays
  sl.registerSingleton<GetHolidaysUseCase>(GetHolidaysUseCase(sl()));
  sl.registerSingleton<GetHolidaysByIdUseCase>(GetHolidaysByIdUseCase(sl()));
  sl.registerSingleton<CreateHolidaysUseCase>(CreateHolidaysUseCase(sl()));
  sl.registerSingleton<UpdateHolidaysUseCase>(UpdateHolidaysUseCase(sl()));

  ///////////////////////////////// BLOCS //////////////////////////////////////

  // Session
  sl.registerFactory<SessionsBloc>(
      () => SessionsBloc(sl(), sl(), sl(), sl(), sl(), sl()));

  // Reservation
  sl.registerFactory<ReservationsBloc>(
      () => ReservationsBloc(sl(), sl(), sl(), sl()));

  // Activity
  sl.registerFactory<ActivitiesBloc>(
      () => ActivitiesBloc(sl(), sl(), sl(), sl()));

  // User
  sl.registerFactory<UserBloc>(
    () => UserBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl()),
  );

  // Holidays
  sl.registerFactory<HolidaysBloc>(
    () => HolidaysBloc(sl(), sl(), sl(), sl()),
  );

  // Establishment
  sl.registerFactory<EstablishmentBloc>(
    () => EstablishmentBloc(sl(), sl(), sl(), sl()),
  );
}
